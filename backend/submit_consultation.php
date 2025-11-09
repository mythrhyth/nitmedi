<?php

// NOTE: Run `composer require phpmailer/phpmailer` first and adjust paths if needed.


require_once __DIR__ . '/../vendor/autoload.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

session_start();
require_once "../db/config.php";
require_once "../includes/functions.php";

$smtpHost = 'smtp.gmail.com';
$smtpPort = 587;
$smtpUser = 'rhythmbhetwal77@gmail.com';        // your SMTP username (e.g. Gmail)
$smtpPass = 'mtlbxipwnkvxvsqq';          // for Gmail use App Password (not account password)
$smtpFromEmail = 'rhythmbhetwal77@gmail.com';
$smtpFromName  = 'NITM Medical Center';
// ---------------------------------------------------------

// Ensure user is logged and is Consultant
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'Consultant') {
    header("Location: index.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: dashboard.php");
    exit;
}

try {
    // Validate required fields (do NOT trust user_id from POST — use session)
    $requiredFields = [
        'patient_type',
        'patient_id',
        'disease_name',
        'consultation_date',
        'consultation_time',
        'triage_priority'
    ];

    foreach ($requiredFields as $field) {
        if (!isset($_POST[$field]) || trim($_POST[$field]) === '') {
            throw new Exception("Missing required field: $field");
        }
    }

    // Step 2: Calculate total medicines cost
    $total_price = 0;
    $medicines_data = [];

    if (!empty($_POST['medicines']) && is_array($_POST['medicines'])) {
        foreach ($_POST['medicines'] as $index => $med) {
            if (!empty($med['medicine_id']) && !empty($med['quantity'])) {
                $medicine_id = (int)$med['medicine_id'];
                $quantity = (int)$med['quantity'];

                $stmtPrice = $pdo->prepare("SELECT price, stock, name FROM medicines WHERE medicine_id = ?");
                $stmtPrice->execute([$medicine_id]);
                $row = $stmtPrice->fetch(PDO::FETCH_ASSOC);

                if (!$row) {
                    throw new Exception("Medicine not found with ID: $medicine_id");
                }

                $unit_price = (float)$row['price'];
                $med_total_price = $unit_price * $quantity;
                $total_price += $med_total_price;

                $medicines_data[] = [
                    'medicine_id' => $medicine_id,
                    'quantity' => $quantity,
                    'unit_price' => $unit_price,
                    'total_price' => $med_total_price,
                    'medicine_name' => $row['name']
                ];
            }
        }
    }

    // Step 3: Insert Consultation (use session user id for consultant to avoid FK issues)
    $stmt = $pdo->prepare("
        INSERT INTO consultations 
        (patient_type, patient_id, user_id, disease_name, consultation_date, consultation_time, triage_priority, symptoms, total_price, referral_status, referral_place, referral_reason, comments)
        VALUES (:patient_type, :patient_id, :user_id, :disease_name, :consultation_date, :consultation_time, :triage_priority, :symptoms, :total_price, :referral_status, :referral_place, :referral_reason, :comments)
    ");

    $insertData = [
        'patient_type' => trim($_POST['patient_type']),
        'patient_id' => trim($_POST['patient_id']),
        'user_id' => 1,  // <-- use session here
        'disease_name' => trim($_POST['disease_name']),
        'consultation_date' => trim($_POST['consultation_date']),
        'consultation_time' => trim($_POST['consultation_time']),
        'triage_priority' => trim($_POST['triage_priority']),
        'symptoms' => $_POST['symptoms'] ?? '',
        'total_price' => $total_price,
        'referral_status' => $_POST['referral_status'] ?? 'No',
        'referral_place' => $_POST['referral_place'] ?? '',
        'referral_reason' => $_POST['referral_reason'] ?? '',
        'comments' => $_POST['comments'] ?? ''
    ];

    $stmt->execute($insertData);
    $consultation_id = $pdo->lastInsertId();

    // Step 4: Insert prescriptions and update stock
    if (!empty($medicines_data)) {
        $stmt2 = $pdo->prepare("
            INSERT INTO prescription (consultation_id, medicine_id, quantity, unit_price, total_price, created_at)
            VALUES (:consultation_id, :medicine_id, :quantity, :unit_price, :total_price, NOW())
        ");
        $stmtUpdateStock = $pdo->prepare("UPDATE medicines SET stock = stock - ? WHERE medicine_id = ?");

        foreach ($medicines_data as $med) {
            $stmt2->execute([
                'consultation_id' => $consultation_id,
                'medicine_id' => $med['medicine_id'],
                'quantity' => $med['quantity'],
                'unit_price' => $med['unit_price'],
                'total_price' => $med['total_price']
            ]);
            $stmtUpdateStock->execute([$med['quantity'], $med['medicine_id']]);
        }
    }

    // Step 5: Prepare email
    $patient_id_raw = trim($_POST['patient_id']);
    $patient_local = strtolower(preg_replace('/\s+/', '', $patient_id_raw));
    if ($patient_local === '') {
        throw new Exception("Invalid patient_id for email.");
    }
    $student_email = $patient_local . '@nitm.ac.in';

    $subject = "Consultation Report - " . $insertData['consultation_date'];

    $messageHtml = "<html><body style='font-family: Arial, sans-serif;'>";
    $messageHtml .= "<h2>Consultation Report</h2>";
    $messageHtml .= "<p><strong>Patient ID:</strong> " . htmlspecialchars($patient_id_raw) . "</p>";
    $messageHtml .= "<p><strong>Disease:</strong> " . htmlspecialchars($insertData['disease_name']) . "</p>";
    $messageHtml .= "<p><strong>Symptoms:</strong> " . nl2br(htmlspecialchars($insertData['symptoms'])) . "</p>";
    $messageHtml .= "<p><strong>Triage Priority:</strong> " . htmlspecialchars($insertData['triage_priority']) . "</p>";
    $messageHtml .= "<p><strong>Date/Time:</strong> " . htmlspecialchars($insertData['consultation_date']) . " " . htmlspecialchars($insertData['consultation_time']) . "</p>";

    if (!empty($medicines_data)) {
        $messageHtml .= "<h3>Prescribed Medicines</h3><ul>";
        foreach ($medicines_data as $med) {
            $messageHtml .= "<li>" . htmlspecialchars($med['medicine_name']) . " - " . (int)$med['quantity'] . " pcs (₹" . number_format($med['total_price'], 2) . ")</li>";
        }
        $messageHtml .= "</ul>";
    } else {
        $messageHtml .= "<p><em>No medicines prescribed.</em></p>";
    }

    $messageHtml .= "<p><strong>Total Cost:</strong> ₹" . number_format($total_price, 2) . "</p>";
    $messageHtml .= "<hr><p><em>This is an automated email from the NITM Medical Center.</em></p>";
    $messageHtml .= "</body></html>";

    // Step 6: Send email via PHPMailer
    $mail = new PHPMailer(true);
    try {
        $mail->isSMTP();
        $mail->Host       = $smtpHost;
        $mail->SMTPAuth   = true;
        $mail->Username   = $smtpUser;
        $mail->Password   = $smtpPass;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port       = $smtpPort;

        $mail->setFrom($smtpFromEmail, $smtpFromName);
        $mail->addAddress($student_email);

        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body    = $messageHtml;
        $mail->AltBody = "Patient ID: $patient_id_raw\nDisease: " . $insertData['disease_name'] . "\nTotal Cost: ₹" . number_format($total_price,2);

        $mail->send();

        echo "<script>alert('Consultation saved and email sent to $student_email'); window.location.href = 'print_consultation.php?id=$consultation_id';</script>";
        exit;
    } catch (Exception $mailEx) {
        // Log or inspect $mail->ErrorInfo if needed
        $err = $mail->ErrorInfo;
        echo "<script>alert('Consultation saved, but email could not be sent: " . addslashes($err) . "'); window.location.href = 'print_consultation.php?id=$consultation_id';</script>";
        exit;
    }

} catch (Exception $e) {
    echo "<div style='padding:20px; background:#fdd; color:#900; border-radius:8px;'>";
    echo "<h3>Error Saving Consultation</h3>";
    echo "<p>" . htmlspecialchars($e->getMessage()) . "</p>";
    echo "<a href='dashboard.php'>Go Back</a>";
    echo "</div>";
    exit;
}
