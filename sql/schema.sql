-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 08, 2025 at 10:38 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical_center`
--
DROP FUNCTION IF EXISTS extract_department;



DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `extract_department` (`student_id` VARCHAR(50)) RETURNS VARCHAR(100) CHARSET utf8mb4 DETERMINISTIC BEGIN
    RETURN CASE 
        WHEN student_id LIKE '%CS%' THEN 'Computer Science'
        WHEN student_id LIKE '%CE%' THEN 'Civil Engineering'
        WHEN student_id LIKE '%EC%' THEN 'Electronics & Communication'
        WHEN student_id LIKE '%EE%' THEN 'Electrical Engineering'
        WHEN student_id LIKE '%ME%' THEN 'Mechanical Engineering'
        WHEN student_id LIKE '%PH%' THEN 'Physics'
        WHEN student_id LIKE '%CB%' THEN 'Chemical Engineering'
        WHEN student_id LIKE '%CY%' THEN 'Chemistry'
        WHEN student_id LIKE '%MA%' THEN 'Mathematics'
        ELSE 'General'
    END;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `phone`, `password`) VALUES
(1, 'Dr. Saiful', 'binarybin2003@gmail.com', '01643352285', '$2y$12$vhqzkp4YtWlpTkTDKHA4BeSHuGs7yQeLnwyDYnqQesDJouTBRPpIq');

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `consultation_id` int NOT NULL AUTO_INCREMENT,
  `patient_type` varchar(50) NOT NULL,
  `patient_id` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  `disease_name` varchar(255) NOT NULL,
  `consultation_date` date NOT NULL,
  `consultation_time` time NOT NULL,
  `triage_priority` varchar(50) NOT NULL,
  `symptoms` text,
  `total_price` decimal(10,2) DEFAULT '0.00',
  `referral_status` varchar(10) DEFAULT 'No',
  `referral_place` varchar(255) DEFAULT NULL,
  `referral_reason` varchar(255) DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`consultation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`consultation_id`, `patient_type`, `patient_id`, `user_id`, `disease_name`, `consultation_date`, `consultation_time`, `triage_priority`, `symptoms`, `total_price`, `referral_status`, `referral_place`, `referral_reason`, `comments`) VALUES
(32, 'Student', 'B24CS041', 2, 'Fever', '2025-09-30', '11:14:00', 'Medium', 'running nose\r\n', 0.00, 'No', '', '', ''),
(33, 'Student', 'B24CS041', 2, 'common cold', '2025-09-30', '11:43:00', 'Low', 'fever cough ', 0.00, 'No', '', '', ''),
(34, 'Student', 'B24CS041', 2, 'typhoid', '2025-09-30', '11:55:00', 'High', 'fever commoncold vomit', 0.00, 'No', '', '', ''),
(35, 'Student', 'B24CS001', 2, 'fiewnjs', '2025-10-01', '14:41:00', 'Critical', 'efiaj', 0.00, 'Yes', 'feb\\shfd', 'fubesdj', 'fahEWIk'),
(36, 'Student', 'B24CS001', 2, 'dAKJ', '2025-10-17', '14:45:00', 'Low', 'iejfnAJKL', 0.00, 'No', '', '', ''),
(37, 'Student', 'B24CS001', 2, 'dAKJ', '2025-10-01', '14:47:00', 'Low', 'dAKJ', 0.00, 'No', '', '', ''),
(38, 'Student', 'B24CS011', 2, 'Flu', '2025-10-01', '14:48:00', 'High', 'Sneezing', 0.00, 'No', '', '', ''),
(39, 'Student', 'B24CS011', 2, 'dAKJ', '2025-10-01', '14:50:00', 'Medium', 'fdkja', 0.00, 'No', '', '', ''),
(40, 'Student', 'B24CS002', 2, 'Deja Vu', '2025-10-01', '14:50:00', 'Critical', 'Mohit Das', 0.00, 'No', '', '', ''),
(41, 'Faculty', '02', 2, 'Fever', '2025-09-04', '05:57:00', 'Low', 'Low BP', 10.00, 'No', '', '', ''),
(42, 'Student', 'B24CS002', 2, 'Mohit Das', '2025-09-11', '15:00:00', 'Critical', 'Insecurity', 0.00, 'No', '', '', ''),
(43, 'Student', 'B24CS019', 2, 'Fever', '2025-10-06', '17:18:00', 'Low', 'sneezing', 268.00, 'No', '', '', ''),
(44, 'Student', 'B22CE011', 2, 'Fever', '2025-10-08', '15:26:00', 'Low', 'Sneezing', 245.00, 'No', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int NOT NULL,
  `faculty_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `department` varchar(50) NOT NULL,
  `total_costs` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `faculty_id`, `name`, `email`, `phone`, `department`, `total_costs`) VALUES
(3, '01', 'Dr. Deepak Kumar', 'hod.cse@nitm.ac.in', '9485177020', 'CSE', 0.00),
(4, '02', 'Prof. Diptendu Sinha Roy', 'diptendu.sr@nitm.ac.in', '94361124204', 'CSE', 0.00),
(5, '03', 'Dr. Manideepa Saha', 'example1@nitm.ac.in', '8549632245', 'MATH', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `medicine_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`medicine_id`, `name`, `stock`, `price`, `expiry_date`) VALUES
(1, 'AZITHRAL 500 TAB', 0, 134.00, NULL),
(2, 'RANTAC 150 TAB', 0, 54.00, NULL),
(3, 'DIGENE TAB', -5, 29.00, NULL),
(4, 'METRON 400 TAB', 0, 26.00, NULL),
(5, 'CALPOL 650 TAB', 0, 34.00, NULL),
(6, 'DOLO 650 TAB', 0, 33.00, NULL),
(7, 'FLUCOLD TAB', 0, 48.00, NULL),
(8, 'CHESTON COLD&FLU ', 0, 70.00, NULL),
(9, 'MAXTRA P TAB ', 0, 48.00, NULL),
(10, 'NEUROBION FORTE', 0, 46.00, NULL),
(11, 'ZERODOL SP TAB', 0, 139.00, NULL),
(12, 'CIPCAL TAB', 0, 104.00, NULL),
(13, 'LIMCEE TAB', 0, 26.00, NULL),
(14, 'DUPHALAC SYRUP (150 mL)', 0, 196.00, NULL),
(15, 'DIOVOL SYRUP (170 mL)', 0, 182.00, NULL),
(16, 'BENADRYL SYRUP ', 0, 170.00, NULL),
(17, 'PENDERM CREAM', 0, 117.00, NULL),
(18, 'VOLINI SPRAY ', 0, 108.00, NULL),
(19, 'WALYTE ORS', 0, 23.00, NULL),
(20, 'MICROPOD 200 TAB', 0, 232.00, NULL),
(21, 'DOXT SL TAB', 0, 146.00, NULL),
(22, 'DELETUS D SYRUP ', 0, 153.00, NULL),
(23, 'SPASMONIL TAB', 0, 32.00, NULL),
(24, 'BETADINE GARGLE ', 0, 203.00, NULL),
(25, 'L HIST MONT TAB', 0, 250.00, NULL),
(26, 'KENACORT  GEL', 0, 165.00, NULL),
(27, 'cefodoxime', 0, 295.00, NULL),
(28, 'Syr. delitus', 0, 157.00, NULL),
(29, 'Syr. zydex', 0, 191.00, NULL),
(30, 'Candid cream', -1, 100.00, NULL),
(31, 'Zerodol P', 0, 77.00, NULL),
(32, 'Tab.wysolone 10 mg', 0, 20.00, NULL),
(33, 'Tab.fluconazole 150mg', 0, 13.00, NULL),
(34, 'Tab.zinc 20mg', 0, 66.00, NULL),
(35, 'Tab. nitroglycerin', 0, 244.00, NULL),
(36, 'Mupirocin ointment', 0, 113.00, NULL),
(37, 'Inj. Lasix 40mg (amp)', 0, 13.00, NULL),
(38, 'Inj.labetalol (amp)', 0, 223.00, NULL),
(39, 'Syr.Citrol', 0, 68.20, NULL),
(40, 'Syr.enzyme 100 mL', 0, 93.00, NULL),
(41, 'Tab.allegra 120 mg', 0, 264.72, NULL),
(42, 'Syr Honeytus', 0, 125.00, NULL),
(43, 'Neosporin ointment', 0, 131.60, NULL),
(44, 'Clotrimazole cream', 0, 50.40, NULL),
(45, 'Nasivion nasal drop', 0, 131.60, NULL),
(46, 'Cap.Omeprazole and domperidone', 0, 95.70, NULL),
(47, 'Candid V cream', 0, 146.00, NULL),
(48, 'Zytee mouth gel', 0, 119.00, NULL),
(49, 'Syr. Cyproheptadine and tricholine hydrochloride 200 mL', 0, 130.00, NULL),
(50, 'Tab.chymoral Forte', 0, 499.00, NULL),
(51, 'Cap.Redotil 100mg', 0, 469.75, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `consultation_id` int NOT NULL,
  `medicine_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`prescription_id`),
  INDEX (`consultation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `consultation_id`, `medicine_id`, `quantity`, `unit_price`, `total_price`, `created_at`) VALUES
(1, 20, 2, 3, 10.00, 30.00, '2025-09-29 20:02:54'),
(2, 21, 1, 3, 10.00, 30.00, '2025-09-29 20:10:20'),
(3, 22, 2, 4, 10.00, 40.00, '2025-09-29 20:13:30'),
(4, 22, 1, 2, 10.00, 20.00, '2025-09-29 20:13:30'),
(5, 23, 2, 5, 10.00, 50.00, '2025-09-29 20:53:40'),
(6, 23, 2, 3, 10.00, 30.00, '2025-09-29 20:53:40'),
(7, 24, 2, 2, 10.00, 20.00, '2025-09-29 21:03:42'),
(8, 24, 1, 4, 10.00, 40.00, '2025-09-29 21:03:42'),
(9, 25, 2, 40, 10.00, 400.00, '2025-09-29 21:05:02'),
(10, 25, 1, 33, 10.00, 330.00, '2025-09-29 21:05:02'),
(11, 26, 2, 5000, 10.00, 50000.00, '2025-09-29 21:08:06'),
(12, 26, 1, 200, 10.00, 2000.00, '2025-09-29 21:08:06'),
(13, 27, 2, 6000, 10.00, 60000.00, '2025-09-29 21:38:57'),
(14, 28, 1, 8000, 10.00, 80000.00, '2025-09-29 21:39:28'),
(15, 29, 1, 4, 10.00, 40.00, '2025-09-29 22:12:21'),
(16, 29, 2, 2, 10.00, 20.00, '2025-09-29 22:12:21'),
(17, 30, 2, 4, 10.00, 40.00, '2025-09-30 04:54:21'),
(18, 31, 1, 3, 10.00, 30.00, '2025-09-30 04:56:04'),
(19, 32, 2, 6, 10.00, 60.00, '2025-09-30 05:45:30'),
(20, 32, 1, 4, 10.00, 40.00, '2025-09-30 05:45:30'),
(21, 33, 1, 1, 10.00, 10.00, '2025-09-30 06:16:00'),
(22, 34, 1, 5000, 10.00, 50000.00, '2025-09-30 06:26:56'),
(23, 35, 1, 7, 10.00, 70.00, '2025-10-01 09:12:56'),
(24, 35, 2, 48, 10.00, 480.00, '2025-10-01 09:12:56'),
(25, 36, 2, 5, 10.00, 50.00, '2025-10-01 09:17:01'),
(26, 36, 1, 15, 10.00, 150.00, '2025-10-01 09:17:01'),
(27, 37, 2, 1, 10.00, 10.00, '2025-10-01 09:18:27'),
(28, 38, 2, 1, 10.00, 10.00, '2025-10-01 09:19:44'),
(29, 39, 1, 15, 10.00, 150.00, '2025-10-01 09:20:22'),
(30, 40, 1, 14, 10.00, 140.00, '2025-10-01 09:21:34'),
(31, 40, 2, 1, 10.00, 10.00, '2025-10-01 09:21:34'),
(32, 41, 2, 1, 10.00, 10.00, '2025-10-01 09:29:03'),
(33, 42, 1, 10, 10.00, 100.00, '2025-10-01 09:31:16'),
(34, 43, 4, 1, 134.00, 134.00, '2025-10-06 11:49:39'),
(35, 43, 4, 1, 134.00, 134.00, '2025-10-06 11:49:39'),
(36, 44, 3, 5, 29.00, 145.00, '2025-10-08 09:57:27'),
(37, 44, 30, 1, 100.00, 100.00, '2025-10-08 09:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `referral_id` int NOT NULL AUTO_INCREMENT,
  `consultation_id` int NOT NULL,
  `place` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`referral_id`),
  INDEX (`consultation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `position` varchar(50) NOT NULL,
  `total_costs` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `Gender` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `total_costs` decimal(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `name`, `Gender`, `email`, `phone`, `department`, `dob`, `total_costs`) VALUES
(1, 'B23CS013', 'Erico N Marak', 'Male', 'b23cs013@nitm.ac.in', '7005407996', 'Computer Science', '0000-00-00', 0.00),
(2, 'B22CE025', 'Aditya Yadav ', 'Male', 'b22ce025@nitm.ac.in', '9140379288', 'Civil Engineering', '0000-00-00', 0.00),
(3, 'B23EC019', 'Kuldeep Chaudhary ', 'Male', 'b23ec019@nitm.ac.in', '6306970805', 'Electronics & Communication', '0000-00-00', 0.00),
(4, 'B24cs031', 'Avishek sah', 'Male', 'b24cs031@nitm.ac.in', '6200344966', 'Computer Science', '0000-00-00', 0.00),
(5, 'B22CS008', 'Rounak Saha ', 'Male', 'b22cs008@nitm.ac.in', '8617422754', 'Computer Science', '0000-00-00', 0.00),
(6, 'B22CE017', 'Anastia Manapchi T Sangma', 'Female', 'b22ce017@nitm.ac.in', '7628835019', 'Civil Engineering', '0000-00-00', 0.00),
(7, 'b23ce017', 'Manish Kumar', 'Male', 'b23ce017@nitm.ac.in', '6378432544', 'Civil Engineering', '0000-00-00', 0.00),
(8, 'B23CS001', 'Aarya mallik', 'Female', 'b23cs001@nitm.ac.in', '7761877668', 'Computer Science', '0000-00-00', 0.00),
(9, 'B23cs004', 'Gabriel L Jongte', 'Male', 'b23cs004@nitm.ac.in', '9366129347', 'Computer Science', '0000-00-00', 0.00),
(10, 'B22CE013', 'K. Lalrindika', 'Male', 'b22ce013@nitm.ac.in', '8731062580', 'Civil Engineering', '0000-00-00', 0.00),
(11, 'B24ME024', 'Raghvendra Pratap Singh', 'Male', 'b24me024@nitm.ac.in', '7398597233', 'Mechanical Engineering', '0000-00-00', 0.00),
(12, 'B22CS004', 'Badurgari Rasool', 'Male', 'b22cs004@nitm.ac.in', '9030292357', 'Computer Science', '0000-00-00', 0.00),
(13, 'B22CE010', 'Ashvil Nagar', 'Male', 'b22ce010@nitm.ac.in', '8824868511', 'Civil Engineering', '0000-00-00', 0.00),
(14, 'b24cs004', 'ARYAN SAHA', 'Male', 'b24cs004@nitm.ac.in', '9366128354', 'Computer Science', '0000-00-00', 0.00),
(15, 'B23ME002', 'Edaki Shilla ', 'Female', 'b23me002@nitm.ac.in', '9233931890', 'Mechanical Engineering', '0000-00-00', 0.00),
(16, 'B24CS020', 'Kunal', 'Male', 'b24cs020@nitm.ac.in', '9259494692', 'Computer Science', '0000-00-00', 0.00),
(17, 'P23PH001', 'RUDRA NARAYAN CHAKRABORTY', 'Male', 'p23ph001@nitm.ac.in', '6294026105', 'Physics', '0000-00-00', 0.00),
(18, 'B24CS026', 'Dharavath Drushyanth ', 'Male', 'b24cs026@nitm.ac.in', '8688771734', 'Computer Science', '0000-00-00', 0.00),
(19, 'B22ME018', 'Aditya kumar pandey', 'Male', 'b22me018@nitm.ac.in', '7808844638', 'Mechanical Engineering', '0000-00-00', 0.00),
(20, 'P24ee008', 'MARIA LOUKRAKPAM', 'Female', 'p24ee008@nitm.ac.in', '8837385038', 'Electrical Engineering', '0000-00-00', 0.00),
(21, 'B23CS015', 'Subrata Das', 'Male', 'b23cs015@nitm.ac.in', '6009082171', 'Computer Science', '0000-00-00', 0.00),
(22, 'B22EE020', 'Tinku Debbarma', 'Male', 'b22ee020@nitm.ac.in', '6009134104', 'Electrical Engineering', '0000-00-00', 0.00),
(23, 'B22EC008', 'Botu Varun Kumar', 'Male', 'b22ec008@nitm.ac.in', '7989644618', 'Electronics & Communication', '0000-00-00', 0.00),
(24, 'B22ME010 ', 'JAGAT DAO', 'Male', 'b22me010@nitm.ac.in', '8822074923', 'Mechanical Engineering', '0000-00-00', 0.00),
(25, 'p21me002', 'aman hira', 'Male', 'p21me002@nitm.ac.in', '8899272735', 'Mechanical Engineering', '0000-00-00', 0.00),
(26, 'B24EC036', 'Palaparthi Keerthi Durga', 'Female', 'b24ec036@nitm.ac.in', '7993843409', 'Electronics & Communication', '0000-00-00', 0.00),
(27, 'B24ME011 ', 'Bhanupratap Singh ', 'Male', 'b24me011@nitm.ac.in', '7870638384', 'Mechanical Engineering', '0000-00-00', 0.00),
(28, 'B22ME008', 'Suhruth Sai Revanuru ', 'Male', 'b22me008@nitm.ac.in', '9390755101', 'Mechanical Engineering', '0000-00-00', 0.00),
(29, 'B24CE016', 'Mc Enbok Khyllep', 'Male', 'b24ce016@nitm.ac.in', '8798181931', 'Civil Engineering', '0000-00-00', 0.00),
(30, 'B22EC021', 'Satyajeet Rai ', 'Male', 'b22ec021@nitm.ac.in', '6391669629', 'Electronics & Communication', '0000-00-00', 0.00),
(31, 'B24CE026 ', 'Puspam Kumari ', 'Female', 'b24ce026@nitm.ac.in', '9934671673', 'Civil Engineering', '0000-00-00', 0.00),
(32, 'P21CE001', 'RASMIRANJAN SAMAL', 'Male', 'p21ce001@nitm.ac.in', '7205086905', 'Civil Engineering', '0000-00-00', 0.00),
(33, 'S24CB017', 'Jakobet Nampui', 'Female', 's24cb017@nitm.ac.in', '6909820677', 'Chemical Engineering', '0000-00-00', 0.00),
(34, 'B22ME029', 'Guguloth Karthik ', 'Male', 'b22me029@nitm.ac.in', '8639140409', 'Mechanical Engineering', '0000-00-00', 0.00),
(35, 'B24ME002 ', 'Tannu Rai ', 'Female', 'b24me002@nitm.ac.in', '9569081320', 'Mechanical Engineering', '0000-00-00', 0.00),
(36, 'B24EC033 ', 'MD Thangirul Hossan Symon ', 'Male', 'b24ec033@nitm.ac.in', '8132907351', 'Electronics & Communication', '0000-00-00', 0.00),
(37, 'P23PH002', 'Pallabi Saha', 'Female', 'p23ph002@nitm.ac.in', '6002250275', 'Physics', '0000-00-00', 0.00),
(38, 'B24CS023 ', 'Priya Saha ', 'Female', 'b24cs023@nitm.ac.in', '9233473072', 'Computer Science', '0000-00-00', 0.00),
(39, 'B22EE008 ', 'Vanyza Lyngshiang ', 'Female', 'b22ee008@nitm.ac.in', '7085761823', 'Electrical Engineering', '0000-00-00', 0.00),
(40, 'P21CE003', 'Athul Nath M K', 'Male', 'p21ce003@nitm.ac.in', '9443000498', 'Civil Engineering', '0000-00-00', 0.00),
(41, 'B24CS039 ', 'Arpan Das Gupta ', 'Male', 'b24cs039@nitm.ac.in', '8413893375', 'Computer Science', '0000-00-00', 0.00),
(42, 'B24EC017', 'Boddepalli Saikumar ', 'Male', 'b24ec017@nitm.ac.in', '9949238533', 'Electronics & Communication', '0000-00-00', 0.00),
(43, 'B22EE013 ', 'Ayush Raj ', 'Male', 'b22ee013@nitm.ac.in', '6203507002', 'Electrical Engineering', '0000-00-00', 0.00),
(44, 'B24EC011', 'Minalish Hajong', 'Female', 'b24ec011@nitm.ac.in', '7005343001', 'Electronics & Communication', '0000-00-00', 0.00),
(45, 'B24CS003', 'Himanshu Gupta', 'Male', 'b24cs003@nitm.ac.in', '8877355802', 'Computer Science', '0000-00-00', 0.00),
(46, 'S24cb005 ', 'Jyotisha Devi ', 'Female', 's24cb005@nitm.ac.in', '6901757667', 'Chemical Engineering', '0000-00-00', 0.00),
(47, 'B22CS038', 'Shivesh Kumar', 'Male', 'b22cs038@nitm.ac.in', '9341619722', 'Computer Science', '0000-00-00', 0.00),
(48, 'B22EE005', 'Ankit Raj', 'Male', 'b22ee005@nitm.ac.in', '8789197839', 'Electrical Engineering', '0000-00-00', 0.00),
(49, 'B22EE002', 'Ankita Rani Sarker', 'Female', 'b22ee002@nitm.ac.in', '8274003775', 'Electrical Engineering', '0000-00-00', 0.00),
(50, 'B24ME001', 'Akash Hajong', 'Male', 'b24me001@nitm.ac.in', '6909789202', 'Mechanical Engineering', '0000-00-00', 0.00),
(51, 'B23ec010', 'Prashant Kumar ', 'Male', 'b23ec010@nitm.ac.in', '9128403116', 'Electronics & Communication', '0000-00-00', 0.00),
(52, 'P21CY003', 'Nazir Uddin', 'Male', 'p21cy003@nitm.ac.in', '7896965971', 'Chemistry', '0000-00-00', 0.00),
(53, 'P23PH003', 'Sanjibani Bhattacharjee ', 'Female', 'p23ph003@nitm.ac.in', '9402505272', 'Physics', '0000-00-00', 0.00),
(54, 'P24me005', 'Rajeev Dwivedi ', 'Male', 'p24me005@nitm.ac.in', '9424441502', 'Mechanical Engineering', '0000-00-00', 0.00),
(55, 'P22PH005', 'Hriditi Howlader ', 'Female', 'p22ph005@nitm.ac.in', '8001345420', 'Physics', '0000-00-00', 0.00),
(56, 'B22EC037', 'Yash Chakraborty', 'Male', 'b22ec037@nitm.ac.in', '9534698426', 'Electronics & Communication', '0000-00-00', 0.00),
(57, 'P22MA008', 'BANKITDOR M NONGRUM', 'Male', 'p22ma008@nitm.ac.in', '9863286695', 'Mathematics', '0000-00-00', 0.00),
(58, 'B22EC042', 'PRANAV KUMAR DUBEY ', 'Male', 'b22ec042@nitm.ac.in', '6202663237', 'Electronics & Communication', '0000-00-00', 0.00),
(59, 'P23CS001', 'ABISEK DAHAL', 'Male', 'p23cs001@nitm.ac.in', '9749350655', 'Computer Science', '0000-00-00', 0.00),
(60, 'B23CE003 ', 'Vicky Seal ', 'Male', 'b23ce003@nitm.ac.in', '9863291260', 'Civil Engineering', '0000-00-00', 0.00),
(61, 'B24EE029 ', 'Aman Kumar Jaiswal ', 'Male', 'b24ee029@nitm.ac.in', '9555295625', 'Electrical Engineering', '0000-00-00', 0.00),
(62, 'P22ME016', 'Damanbha Marwein ', 'Male', 'p22me016@nitm.ac.in', '8787688566', 'Mechanical Engineering', '0000-00-00', 0.00),
(63, 'B22EE010 ', 'Sanapala Rahul ', 'Male', 'b22ee010@nitm.ac.in', '9966781796', 'Electrical Engineering', '0000-00-00', 0.00),
(64, 'B22CS007', 'Manish Prasad Gupta', 'Male', 'b22cs007@nitm.ac.in', '8732056328', 'Computer Science', '0000-00-00', 0.00),
(65, 'b22cs036', 'Mrinmoy Maji', 'Male', 'b22cs036@nitm.ac.in', '8617406970', 'Computer Science', '0000-00-00', 0.00),
(66, 'T24CE004', 'Rebecca Eirene Khasain', 'Female', 't24ce004@nitm.ac.in', '9366270891', 'Civil Engineering', '0000-00-00', 0.00),
(67, 'P22CS009', 'Shreerudra Pratik', 'Male', 'p22cs009@nitm.ac.in', '9827367300', 'Computer Science', '0000-00-00', 0.00),
(68, 'B22EC041 ', 'Rimple kumari ', 'Female', 'b22ec041@nitm.ac.in', '9304126649', 'Electronics & Communication', '0000-00-00', 0.00),
(69, 'B24EC007', 'Md kashif Iqbal ', 'Male', 'b24ec007@nitm.ac.in', '9304329699', 'Electronics & Communication', '0000-00-00', 0.00),
(70, 'B23CE012', 'Ridahun Nongkhlaw ', 'Female', 'b23ce012@nitm.ac.in', '8787370114', 'Civil Engineering', '0000-00-00', 0.00),
(71, 'P24CS011', 'Shemphang Ryntathiang', 'Male', 'p24cs011@nitm.ac.in', '9774546083', 'Computer Science', '0000-00-00', 0.00),
(72, 'T24CS004', 'Lakshajyoti Paul ', 'Male', 't24cs004@nitm.ac.in', '8837091910', 'Computer Science', '0000-00-00', 0.00),
(73, 'B24CS010', 'Deepansh sah', 'Male', 'b24cs010@nitm.ac.in', '6202820044', 'Computer Science', '0000-00-00', 0.00),
(74, 'B24CS018', 'Ankita Singh ', 'Female', 'b24cs018@nitm.ac.in', '9305009324', 'Computer Science', '0000-00-00', 0.00),
(75, 'B24EC013', 'Gorla Usannagari Jagadishwar Yadav', 'Male', 'b24ec013@nitm.ac.in', '7993906237', 'Electronics & Communication', '0000-00-00', 0.00),
(76, 'B24CS036', 'Kunjana Panthy ', 'Female', 'b24cs036@nitm.ac.in', '8540932310', 'Computer Science', '0000-00-00', 0.00),
(77, 'B24EE028', 'Abhyuday Kumar', 'Male', 'b24ee028@nitm.ac.in', '9162861544', 'Electrical Engineering', '0000-00-00', 0.00),
(78, 'P23EE004 ', 'VIANNY WAHLANG ', 'Male', 'p23ee004@nitm.ac.in', '8014764881', 'Electrical Engineering', '0000-00-00', 0.00),
(79, 'B22ME020 ', 'Manisha Kumari ', 'Female', 'b22me020@nitm.ac.in', '9142021407', 'Mechanical Engineering', '0000-00-00', 0.00),
(80, 'S24MA009 ', 'Ariket Bhattacharjee ', 'Male', 's24ma009@nitm.ac.in', '7477371161', 'Mathematics', '0000-00-00', 0.00),
(81, 'B22CE015', 'Aricksha R Marak', 'Female', 'b22ce015@nitm.ac.in', '9612107294', 'Civil Engineering', '0000-00-00', 0.00),
(82, 'B22EC039', 'RIYA BHANDARI ', 'Female', 'b22ec039@nitm.ac.in', '6287867698', 'Electronics & Communication', '0000-00-00', 0.00),
(83, 'P23CY002', 'SURENDRA NATH BARMAN', 'Male', 'p23cy002@nitm.ac.in', '7029881422', 'Chemistry', '0000-00-00', 0.00),
(84, 'P24me004', 'Piyush yadav', 'Male', 'p24me004@nitm.ac.in', '7693883779', 'Mechanical Engineering', '0000-00-00', 0.00),
(85, 'B24CS049', 'Sumit Kumar', 'Male', 'b24cs049@nitm.ac.in', '8937041361', 'Computer Science', '0000-00-00', 0.00),
(86, 'B24EE023', 'Gabriel Khongshah', 'Male', 'b24ee023@nitm.ac.in', '7642932314', 'Electrical Engineering', '0000-00-00', 0.00),
(87, 'B22EE004', 'Kyntubhah Bamon', 'Male', 'b22ee004@nitm.ac.in', '9362173765', 'Electrical Engineering', '0000-00-00', 0.00),
(88, 'B24ME030', 'Ayush Kumar', 'Male', 'b24me030@nitm.ac.in', '8809634554', 'Mechanical Engineering', '0000-00-00', 0.00),
(89, 'B24ME012', 'Sachin Pandey', 'Male', 'b24me012@nitm.ac.in', '9569782622', 'Mechanical Engineering', '0000-00-00', 0.00),
(90, 'P22HS001', 'Thangjam Ayingbi Chanu ', 'Female', 'p22hs001@nitm.ac.in', '7005151101', 'General', '0000-00-00', 0.00),
(91, 'B22EC025 ', 'Adarsh Kumar Shrivastav', 'Male', 'b22ec025@nitm.ac.in', '6209587650', 'Electronics & Communication', '0000-00-00', 0.00),
(92, 'B22CE029 ', 'SAURAV KUMAR ', 'Male', 'b22ce029@nitm.ac.in', '7643875450', 'Civil Engineering', '0000-00-00', 0.00),
(93, 'b22cs016', 'Pilli Shanyu Veda Seshu ', 'Male', 'b22cs016@nitm.ac.in', '9573622789', 'Computer Science', '0000-00-00', 0.00),
(94, 'P22EC011', 'JACINTA POTSANGBAM', 'Female', 'p22ec011@nitm.ac.in', '8257997604', 'Electronics & Communication', '0000-00-00', 0.00),
(95, 'B23ME024 ', 'Rupak Sonowal ', 'Male', 'b23me024@nitm.ac.in', '8822060494', 'Mechanical Engineering', '0000-00-00', 0.00),
(96, 'S24MA010', 'Sitanshu Sahu ', 'Male', 's24ma010@nitm.ac.in', '7905408834', 'Mathematics', '0000-00-00', 0.00),
(97, 'B23ME031 ', 'AMAN MINA ', 'Male', 'b23me031@nitm.ac.in', '7877889796', 'Mechanical Engineering', '0000-00-00', 0.00),
(98, 'B24CS001', 'Mohit kumar Prasad', 'Male', 'b24cs001@nitm.ac.in', '6033176965', 'Computer Science', '0000-00-00', 0.00),
(99, 'B24CS019 ', 'B J Mahalakshmi ', 'Female', 'b24cs019@nitm.ac.in', '8977059760', 'Computer Science', '0000-00-00', 0.00),
(100, 'B23EE026 ', 'Sanjana thothu ', 'Female', 'b23ee026@nitm.ac.in', '9959119624', 'Electrical Engineering', '0000-00-00', 0.00),
(101, 'S24CB012', 'Bansika Khatri', 'Female', 's24cb012@nitm.ac.in', '8609088973', 'Chemical Engineering', '0000-00-00', 0.00),
(102, 'S24cb011', 'Omme Salma ', 'Female', 's24cb011@nitm.ac.in', '9366720179', 'Chemical Engineering', '0000-00-00', 0.00),
(103, 'B23ec001', 'Syed Mohammad Ashraf Uddin Rafi ', 'Male', 'b23ec001@nitm.ac.in', '6033389862', 'Electronics & Communication', '0000-00-00', 0.00),
(104, 'B24EC015 ', 'Bejagam Ratna Sanjana ', 'Female', 'b24ec015@nitm.ac.in', '8688936628', 'Electronics & Communication', '0000-00-00', 0.00),
(105, 'P22PH008', 'Rimpee Kumari Sah', 'Female', 'p22ph008@nitm.ac.in', '9859184491', 'Physics', '0000-00-00', 0.00),
(106, 'b22ee023 ', 'Ebarnes Kharwar ', 'Male', 'b22ee023@nitm.ac.in', '9863382883', 'Electrical Engineering', '0000-00-00', 0.00),
(107, 'B24EE020', 'Bhawani Shankar ', 'Male', 'b24ee020@nitm.ac.in', '7737819160', 'Electrical Engineering', '0000-00-00', 0.00),
(108, 'B22CS015', 'Wamesambiang Laloo ', 'Male', 'b22cs015@nitm.ac.in', '9612502641', 'Computer Science', '0000-00-00', 0.00),
(109, 'B23EE011', 'Ippili Rupesh', 'Male', 'b23ee011@nitm.ac.in', '9182163289', 'Electrical Engineering', '0000-00-00', 0.00),
(110, 'T24EE003', 'Dathrang I Kyndiah', 'Male', 't24ee003@nitm.ac.in', '9366573881', 'Electrical Engineering', '0000-00-00', 0.00),
(111, 'b24cs043', 'Md. Rayed Raiyan', 'Male', 'b24cs043@nitm.ac.in', '7005446549', 'Computer Science', '0000-00-00', 0.00),
(112, 'S24CB004', 'MARISAMY M', 'Male', 's24cb004@nitm.ac.in', '9884107429', 'Chemical Engineering', '0000-00-00', 0.00),
(113, 'T24EC003', 'Dasainmiki Diengdoh ', 'Male', 't24ec003@nitm.ac.in', '8132002976', 'Electronics & Communication', '0000-00-00', 0.00),
(114, 'B22CS019 ', 'Gurijala Meghana ', 'Female', 'b22cs019@nitm.ac.in', '9863640393', 'Computer Science', '0000-00-00', 0.00),
(115, 'B22EC036', 'Charagundla Sai Laxman', 'Male', 'b22ec036@nitm.ac.in', '6304126163', 'Electronics & Communication', '0000-00-00', 0.00),
(116, 'P22EC002', 'Sunanda Mukhopadhyay', 'Female', 'p22ec002@nitm.ac.in', '9474878472', 'Electronics & Communication', '0000-00-00', 0.00),
(117, 'B23EE024', 'Yashvi Arya', 'Female', 'b23ee024@nitm.ac.in', '6351646385', 'Electrical Engineering', '0000-00-00', 0.00),
(118, 'S24CB002', 'BHARGAV BHARADWAJ', 'Male', 's24cb002@nitm.ac.in', '7086443016', 'Chemical Engineering', '0000-00-00', 0.00),
(119, 'B22CE001', 'Dip Kundu', 'Male', 'b22ce001@nitm.ac.in', '7407220527', 'Civil Engineering', '0000-00-00', 0.00),
(120, 'B22EC020', 'Muddada Satwik ', 'Male', 'b22ec020@nitm.ac.in', '9121267278', 'Electronics & Communication', '0000-00-00', 0.00),
(121, 'S24PH006', 'Patel Jalpan Maheshbhai', 'Male', 's24ph006@nitm.ac.in', '7383979989', 'Physics', '0000-00-00', 0.00),
(122, 'P23CE002', 'Sonia Raj Gurung', 'Female', 'p23ce002@nitm.ac.in', '8761808737', 'Civil Engineering', '0000-00-00', 0.00),
(123, 'P24ec011 ', 'Parishmita Goswami ', 'Female', 'p24ec011@nitm.ac.in', '9101327188', 'Electronics & Communication', '0000-00-00', 0.00),
(124, 'B23CS020', 'Chuncha Hemchand', 'Male', 'b23cs020@nitm.ac.in', '7386618846', 'Computer Science', '0000-00-00', 0.00),
(125, 'B23EE030', 'Ramavath Dharam Singh ', 'Male', 'b23ee030@nitm.ac.in', '9515913947', 'Electrical Engineering', '0000-00-00', 0.00),
(126, 'B22CE003', 'Alok Kumar Mishra', 'Male', 'b22ce003@nitm.ac.in', '9431606554', 'Civil Engineering', '0000-00-00', 0.00),
(127, 'B22EE016', 'Ibalahunshisha Kharmih ', 'Female', 'b22ee016@nitm.ac.in', '9366162909', 'Electrical Engineering', '0000-00-00', 0.00),
(128, 'B23CE002 ', 'Vianey Banera Ch Marak ', 'Female', 'b23ce002@nitm.ac.in', '7630984009', 'Civil Engineering', '0000-00-00', 0.00),
(129, 'B22ce018 ', 'Parkizar R sangma', 'Female', 'b22ce018@nitm.ac.in', '9863342750', 'Civil Engineering', '0000-00-00', 0.00),
(130, 'B23EC027', 'Sanjana Tiwari ', 'Female', 'b23ec027@nitm.ac.in', '9708955494', 'Electronics & Communication', '0000-00-00', 0.00),
(131, 'B23CS017 ', 'Shefali ', 'Female', 'b23cs017@nitm.ac.in', '9142369013', 'Computer Science', '0000-00-00', 0.00),
(132, 'B22ME014', 'Penumala Sujith kausal ', 'Male', 'b22me014@nitm.ac.in', '9381501002', 'Mechanical Engineering', '0000-00-00', 0.00),
(133, 'B23ME010 ', 'Charity Rymbai', 'Male', 'b23me010@nitm.ac.in', '7641809628', 'Mechanical Engineering', '0000-00-00', 0.00),
(134, 's24ph018 ', 'Saurav Das', 'Male', 's24ph018@nitm.ac.in', '7005048946', 'Physics', '0000-00-00', 0.00),
(135, 'B22EE012', 'B Vedant ', 'Male', 'b22ee012@nitm.ac.in', '9971952340', 'Electrical Engineering', '0000-00-00', 0.00),
(136, 'T24EC010 ', 'Pasli Rasmut ', 'Male', 't24ec010@nitm.ac.in', '7629908303', 'Electronics & Communication', '0000-00-00', 0.00),
(137, 'B24CS015', 'Yatharth Singh', 'Male', 'b24cs015@nitm.ac.in', '9793700881', 'Computer Science', '0000-00-00', 0.00),
(138, 'P24CY001', 'RASENDRA SHUKLA ', 'Male', 'p24cy001@nitm.ac.in', '8574881883', 'Chemistry', '0000-00-00', 0.00),
(139, 'B24EE026 ', 'MANELLI BABUJI ', 'Male', 'b24ee026@nitm.ac.in', '8787337443', 'Electrical Engineering', '0000-00-00', 0.00),
(140, 'P24CE004', 'ARKISHEMBHA SOHLIYA ', 'Male', 'p24ce004@nitm.ac.in', '8787641533', 'Civil Engineering', '0000-00-00', 0.00),
(141, 'B24EE008', 'DIVYASHAKTI ', 'Female', 'b24ee008@nitm.ac.in', '7979956268', 'Electrical Engineering', '0000-00-00', 0.00),
(142, 'B22EE030 ', 'Mayank Mishra ', 'Male', 'b22ee030@nitm.ac.in', '7250336960', 'Electrical Engineering', '0000-00-00', 0.00),
(143, 'B23EE001', 'Golam Rabbany', 'Male', 'b23ee001@nitm.ac.in', '6033389975', 'Electrical Engineering', '0000-00-00', 0.00),
(144, 'B24CE019 ', 'ARJESTSON THABAH ', 'Male', 'b24ce019@nitm.ac.in', '8119832617', 'Civil Engineering', '0000-00-00', 0.00),
(145, 'P21EC002', 'Mahima Chaudhary', 'Female', 'p21ec002@nitm.ac.in', '7999654756', 'Electronics & Communication', '0000-00-00', 0.00),
(146, 'B23CS037', 'Jishnu Duhan', 'Male', 'b23cs037@nitm.ac.in', '9812660164', 'Computer Science', '0000-00-00', 0.00),
(147, 'B24CE014', 'Shreya Raj ', 'Female', 'b24ce014@nitm.ac.in', '7903928278', 'Civil Engineering', '0000-00-00', 0.00),
(148, 'B24ME015 ', 'Amar ', 'Male', 'b24me015@nitm.ac.in', '8094360588', 'Mechanical Engineering', '0000-00-00', 0.00),
(149, 'B22EC007', 'Pulagam Ajay Kumar Reddy', 'Male', 'b22ec007@nitm.ac.in', '9390313731', 'Electronics & Communication', '0000-00-00', 0.00),
(150, 'P24EC002', 'JAMES L LYNGKHOI', 'Male', 'p24ec002@nitm.ac.in', '8787481492', 'Electronics & Communication', '0000-00-00', 0.00),
(151, 'B24EC025 ', 'Pettam Bhagirath ', 'Male', 'b24ec025@nitm.ac.in', '6302005528', 'Electronics & Communication', '0000-00-00', 0.00),
(152, 'b24me033', 'ANUP BARUA ', 'Male', 'b24me033@nitm.ac.in', '6033426922', 'Mechanical Engineering', '0000-00-00', 0.00),
(153, 'P22PH004', 'Adrish Chakraborty', 'Male', 'p22ph004@nitm.ac.in', '8474032160', 'Physics', '0000-00-00', 0.00),
(154, 'p19ee014', 'SHIBAJI MONDAL', 'Male', 'p19ee014@nitm.ac.in', '9239337336', 'Electrical Engineering', '0000-00-00', 0.00),
(155, 'B22EC018', 'Kilaparthi Uday Shankar ', 'Male', 'b22ec018@nitm.ac.in', '7995215669', 'Electronics & Communication', '0000-00-00', 0.00),
(156, 'B23me025', 'JOHN NELVIDSON MARWEIN ', 'Male', 'b23me025@nitm.ac.in', '6909034205', 'Mechanical Engineering', '0000-00-00', 0.00),
(157, 'P22EC012', 'Amartya Paul', 'Male', 'p22ec012@nitm.ac.in', '7837622017', 'Electronics & Communication', '0000-00-00', 0.00),
(158, 'B22ME011', 'Shivam Kumar ', 'Male', 'b22me011@nitm.ac.in', '8081817904', 'Mechanical Engineering', '0000-00-00', 0.00),
(159, 'P24ME011', 'Vijay Prakash', 'Male', 'p24me011@nitm.ac.in', '8805866885', 'Mechanical Engineering', '0000-00-00', 0.00),
(160, 'B24EC006', 'AMRITA KUMARI', 'Female', 'b24ec006@nitm.ac.in', '8974555142', 'Electronics & Communication', '0000-00-00', 0.00),
(161, 'B24EC005', 'Sanjog Singh', 'Male', 'b24ec005@nitm.ac.in', '8787534593', 'Electronics & Communication', '0000-00-00', 0.00),
(162, 'B23EC040 ', 'Saurav Kumar ', 'Male', 'b23ec040@nitm.ac.in', '9508140667', 'Electronics & Communication', '0000-00-00', 0.00),
(163, 'P22MA005', 'Sovrin Pal', 'Male', 'p22ma005@nitm.ac.in', '8972903253', 'Mathematics', '0000-00-00', 0.00),
(164, 'B24ME009 ', 'Sumarlang Syiemlieh ', 'Male', 'b24me009@nitm.ac.in', '9362048929', 'Mechanical Engineering', '0000-00-00', 0.00),
(165, 'B23EE010 ', 'Sachin Chaurasia ', 'Male', 'b23ee010@nitm.ac.in', '8418820042', 'Electrical Engineering', '0000-00-00', 0.00),
(166, 'B23EC017 ', 'Priyangshu Das ', 'Male', 'b23ec017@nitm.ac.in', '6297843796', 'Electronics & Communication', '0000-00-00', 0.00),
(167, 'b24ec027', 'Hitesh Sharma ', 'Male', 'b24ec027@nitm.ac.in', '9588212065', 'Electronics & Communication', '0000-00-00', 0.00),
(168, 'P24EE006 ', 'MD ARIF HUSSAIN ', 'Male', 'p24ee006@nitm.ac.in', '8882190633', 'Electrical Engineering', '0000-00-00', 0.00),
(169, 'S24MA006 ', 'Brishty kumari ', 'Female', 's24ma006@nitm.ac.in', '8987566022', 'Mathematics', '0000-00-00', 0.00),
(170, 'P23ME003 ', 'Rohit Pahariya', 'Male', 'p23me003@nitm.ac.in', '9975272586', 'Mechanical Engineering', '0000-00-00', 0.00),
(171, 'T24ME003', 'Rikidame Manner ', 'Male', 't24me003@nitm.ac.in', '6009631745', 'Mechanical Engineering', '0000-00-00', 0.00),
(172, 'T24CS011', 'Rahul Maity', 'Male', 't24cs011@nitm.ac.in', '9088985200', 'Computer Science', '0000-00-00', 0.00),
(173, 'T24cs022', 'Abhijit Kachary', 'Male', 't24cs022@nitm.ac.in', '6002049036', 'Computer Science', '0000-00-00', 0.00),
(174, 'P24EC006', 'Brijmohan Chaurasia', 'Male', 'p24ec006@nitm.ac.in', '9074841310', 'Electronics & Communication', '0000-00-00', 0.00),
(175, 'P24ME008', 'SATYABRATA SAHOO', 'Male', 'p24me008@nitm.ac.in', '8596860939', 'Mechanical Engineering', '0000-00-00', 0.00),
(176, 'B23EC030', 'Vivek Patel ', 'Male', 'b23ec030@nitm.ac.in', '7088679601', 'Electronics & Communication', '0000-00-00', 0.00),
(177, 'S24PH001', 'Divyanshu Kumar ', 'Male', 's24ph001@nitm.ac.in', '7678679755', 'Physics', '0000-00-00', 0.00),
(178, 'B22ME005 ', 'Pyndapmain Marngar ', 'Male', 'b22me005@nitm.ac.in', '6909640847', 'Mechanical Engineering', '0000-00-00', 0.00),
(179, 'B22EE029', 'GILLFORDSON JALA', 'Male', 'b22ee029@nitm.ac.in', '9366960716', 'Electrical Engineering', '0000-00-00', 0.00),
(180, 'B23EE012', 'Eleazer Lamat ', 'Male', 'b23ee012@nitm.ac.in', '9362067042', 'Electrical Engineering', '0000-00-00', 0.00),
(181, 'B23CS019', 'Shashank Umar Vaishy', 'Male', 'b23cs019@nitm.ac.in', '9335310024', 'Computer Science', '0000-00-00', 0.00),
(182, 'B22EC027', 'F Emend Grace Aroma Marwein', 'Female', 'b22ec027@nitm.ac.in', '7085353539', 'Electronics & Communication', '0000-00-00', 0.00),
(183, 'S24cb007', 'Chinmaya kumar pradhan ', 'Male', 's24cb007@nitm.ac.in', '9938846995', 'Chemical Engineering', '0000-00-00', 0.00),
(184, 'B22EE018', 'Ayush Kumar', 'Male', 'b22ee018@nitm.ac.in', '7667277647', 'Electrical Engineering', '0000-00-00', 0.00),
(185, 'B24EC019 ', 'Bomminayuni Brundasri ', 'Female', 'b24ec019@nitm.ac.in', '8143915369', 'Electronics & Communication', '0000-00-00', 0.00),
(186, 'B24EC034', 'Shubham Pandey', 'Male', 'b24ec034@nitm.ac.in', '9520000582', 'Electronics & Communication', '0000-00-00', 0.00),
(187, 'B24EC022 ', 'Kasin Salkimo G Momin ', 'Male', 'b24ec022@nitm.ac.in', '9233928012', 'Electronics & Communication', '0000-00-00', 0.00),
(188, 't24cs010', 'Siddhant Siwach', 'Male', 't24cs010@nitm.ac.in', '7534030419', 'Computer Science', '0000-00-00', 0.00),
(189, 'B22CE005', 'Hosea D Sangma', 'Male', 'b22ce005@nitm.ac.in', '9863057664', 'Civil Engineering', '0000-00-00', 0.00),
(190, 'B22EE015 ', 'Luckystar Syiem ', 'Male', 'b22ee015@nitm.ac.in', '8414028221', 'Electrical Engineering', '0000-00-00', 0.00),
(191, 'B23ME009', 'Brightly Islary', 'Male', 'b23me009@nitm.ac.in', '8822429365', 'Mechanical Engineering', '0000-00-00', 0.00),
(192, 'B22ME022', 'Salgra Ch Marak', 'Male', 'b22me022@nitm.ac.in', '9863008380', 'Mechanical Engineering', '0000-00-00', 0.00),
(193, 'B24ce020 ', 'Talari Bhanuprasad ', 'Male', 'b24ce020@nitm.ac.in', '9848554462', 'Civil Engineering', '0000-00-00', 0.00),
(194, 'S24PH005', 'Chirag Saha', 'Male', 's24ph005@nitm.ac.in', '7044092095', 'Physics', '0000-00-00', 0.00),
(195, 'T24CS021', 'Phidaiaibha Syiemlieh ', 'Female', 't24cs021@nitm.ac.in', '8794040851', 'Computer Science', '0000-00-00', 0.00),
(196, 'B22EC006 ', 'Winson Suchiang ', 'Male', 'b22ec006@nitm.ac.in', '8132853149', 'Electronics & Communication', '0000-00-00', 0.00),
(197, 'p24CE008', 'SOUMYA RANJAN SATAPATHY ', 'Male', 'p24ce008@nitm.ac.in', '7008541490', 'Civil Engineering', '0000-00-00', 0.00),
(198, 'T24CS018', 'Agatha Zara Swett', 'Female', 't24cs018@nitm.ac.in', '9774296184', 'Computer Science', '0000-00-00', 0.00),
(199, 't24cs017', 'Philarihun Khongshah', 'Female', 't24cs017@nitm.ac.in', '8014864680', 'Computer Science', '0000-00-00', 0.00),
(200, 'P23EC002', 'DEBOJYOTI CHATTAPADHYAY', 'Male', 'p23ec002@nitm.ac.in', '9123013697', 'Electronics & Communication', '0000-00-00', 0.00),
(201, 'B24CE018', 'Midanchi M Sangma ', 'Female', 'b24ce018@nitm.ac.in', '6909628372', 'Civil Engineering', '0000-00-00', 0.00),
(202, 'p24me009 ', 'Shivashree Sharma', 'Female', 'p24me009@nitm.ac.in', '7002684652', 'Mechanical Engineering', '0000-00-00', 0.00),
(203, 'S24cb014 ', 'Riboklang Thongni ', 'Male', 's24cb014@nitm.ac.in', '6009943470', 'Chemical Engineering', '0000-00-00', 0.00),
(204, 'B22ME016 ', 'Piyush Tiwari ', 'Male', 'b22me016@nitm.ac.in', '8382972277', 'Mechanical Engineering', '0000-00-00', 0.00),
(205, 'T24EC002', 'Shahoj Chakma', 'Male', 't24ec002@nitm.ac.in', '8290336064', 'Electronics & Communication', '0000-00-00', 0.00),
(206, 'B24CS038', 'Rhythm Bhetwal', 'Female', 'b24cs038@nitm.ac.in', '8787538731', 'Computer Science', '0000-00-00', 0.00),
(207, 'B22EC016', 'Chandrani Dalui ', 'Female', 'b22ec016@nitm.ac.in', '9330565157', 'Electronics & Communication', '0000-00-00', 0.00),
(208, 'B23EC004 ', 'Uttam Kumar ', 'Male', 'b23ec004@nitm.ac.in', '6009319894', 'Electronics & Communication', '0000-00-00', 0.00),
(209, 'B23CE016 ', 'IAHUNLANG KHARMYNTHON ', 'Female', 'b23ce016@nitm.ac.in', '8415947781', 'Civil Engineering', '0000-00-00', 0.00),
(210, 'B24EE003', 'Norime M Marak ', 'Female', 'b24ee003@nitm.ac.in', '8798931993', 'Electrical Engineering', '0000-00-00', 0.00),
(211, 'B22CS020', 'Mebanker Khyriem ', 'Male', 'b22cs020@nitm.ac.in', '6009003974', 'Computer Science', '0000-00-00', 0.00),
(212, 'B22EC032', 'Angshuman Dey', 'Male', 'b22ec032@nitm.ac.in', '9863939168', 'Electronics & Communication', '0000-00-00', 0.00),
(213, 'B22ME030', 'Minggamat Ch Momin', 'Male', 'b22me030@nitm.ac.in', '6009671574', 'Mechanical Engineering', '0000-00-00', 0.00),
(214, 'B24EE001', 'Abhishek Jaiswal', 'Male', 'b24ee001@nitm.ac.in', '8081175233', 'Electrical Engineering', '0000-00-00', 0.00),
(215, 'B22CS034', 'SOHAN SAHA', 'Male', 'b22cs034@nitm.ac.in', '8420538331', 'Computer Science', '0000-00-00', 0.00),
(216, 'B22CE009', 'CHARELANGMI I SHYLLA', 'Male', 'b22ce009@nitm.ac.in', '8415006251', 'Civil Engineering', '0000-00-00', 0.00),
(217, 'B24ME007 ', 'Aisukphylla Jyndiang ', 'Female', 'b24me007@nitm.ac.in', '9863575288', 'Mechanical Engineering', '0000-00-00', 0.00),
(218, 'S24PH003', 'Vinayak Chakraborty ', 'Male', 's24ph003@nitm.ac.in', '8016278196', 'Physics', '0000-00-00', 0.00),
(219, 'S24CB008 ', 'Nita Sarmah ', 'Female', 's24cb008@nitm.ac.in', '7086712842', 'Chemical Engineering', '0000-00-00', 0.00),
(220, 't24ec012', 'Risika kumari ', 'Female', 't24ec012@nitm.ac.in', '8974009040', 'Electronics & Communication', '0000-00-00', 0.00),
(221, 'B23EC002', 'SHANMIM KARIM TONMOY', 'Male', 'b23ec002@nitm.ac.in', '8787815415', 'Electronics & Communication', '0000-00-00', 0.00),
(222, 'B24CS037', 'PASUPUREDDY SHYAMESWAR', 'Male', 'b24cs037@nitm.ac.in', '7893281282', 'Computer Science', '0000-00-00', 0.00),
(223, 'B22CE007 ', 'Davidson Lyngdoh ', 'Male', 'b22ce007@nitm.ac.in', '8729890185', 'Civil Engineering', '0000-00-00', 0.00),
(224, 'b22cs001', 'Md. Rasel Mandol', 'Male', 'b22cs001@nitm.ac.in', '6033390047', 'Computer Science', '0000-00-00', 0.00),
(225, 'T24CS006', 'MRIGANKA SHEKHAR DAS', 'Male', 't24cs006@nitm.ac.in', '7908018302', 'Computer Science', '0000-00-00', 0.00),
(226, 'B24EC002 ', 'Bajanai Kharmynthon', 'Female', 'b24ec002@nitm.ac.in', '6009348939', 'Electronics & Communication', '0000-00-00', 0.00),
(227, 'B22CS017', 'Aman Singh Rathore', 'Male', 'b22cs017@nitm.ac.in', '7800891091', 'Computer Science', '0000-00-00', 0.00),
(228, 'B23EC034 ', 'PRADIP KUMAR MONDAL ', 'Male', 'b23ec034@nitm.ac.in', '7477850012', 'Electronics & Communication', '0000-00-00', 0.00),
(229, 'B24cs029 ', 'Homerson Kharmalki ', 'Male', 'b24cs029@nitm.ac.in', '9485390816', 'Computer Science', '0000-00-00', 0.00),
(230, 'B22CE014', 'Neelkantha Mandal', 'Male', 'b22ce014@nitm.ac.in', '8348994393', 'Civil Engineering', '0000-00-00', 0.00),
(231, 'B24CS042', 'Akash Malaker ', 'Male', 'b24cs042@nitm.ac.in', '6033426948', 'Computer Science', '0000-00-00', 0.00),
(232, 'S24MA018', 'Jeffree Sympli', 'Male', 's24ma018@nitm.ac.in', '7642925759', 'Mathematics', '0000-00-00', 0.00),
(233, 'b24me032', 'VISLAVATH SHIVA NAIK ', 'Male', 'b24me032@nitm.ac.in', '9324094354', 'Mechanical Engineering', '0000-00-00', 0.00),
(234, 'T24CS012', 'Skhembor Suchen', 'Male', 't24cs012@nitm.ac.in', '9366836077', 'Computer Science', '0000-00-00', 0.00),
(235, 'B24CS045', 'Anshu Mohit ', 'Male', 'b24cs045@nitm.ac.in', '8210692851', 'Computer Science', '0000-00-00', 0.00),
(236, 'T24EC008 ', 'Eugene Daniel Phin ', 'Male', 't24ec008@nitm.ac.in', '7085923391', 'Electronics & Communication', '0000-00-00', 0.00),
(237, 'B24EE011 ', 'RICHBERT S MASHLI ', 'Male', 'b24ee011@nitm.ac.in', '7085622401', 'Electrical Engineering', '0000-00-00', 0.00),
(238, 'B22EE006', 'Alismita Boro', 'Female', 'b22ee006@nitm.ac.in', '9394926914', 'Electrical Engineering', '0000-00-00', 0.00),
(239, 'P21CE006', 'Avishek Goswami', 'Male', 'p21ce006@nitm.ac.in', '9957700657', 'Civil Engineering', '0000-00-00', 0.00),
(240, 'P21CE007', 'Anjali Kumari Pravin Kumar Pandey ', 'Female', 'p21ce007@nitm.ac.in', '8169036466', 'Civil Engineering', '0000-00-00', 0.00),
(241, 'B24ME022', 'Midasala Bhanu Vardhan Rao', 'Male', 'b24me022@nitm.ac.in', '7719522961', 'Mechanical Engineering', '0000-00-00', 0.00),
(242, 'B24CE028 ', 'Aditya Tripathi ', 'Male', 'b24ce028@nitm.ac.in', '7905888044', 'Civil Engineering', '0000-00-00', 0.00),
(243, 'P22PH007', 'Dipta Suryya Mahanta', 'Male', 'p22ph007@nitm.ac.in', '9101235489', 'Physics', '0000-00-00', 0.00),
(244, 'B22EE022 ', 'Damelambor Nongsiej ', 'Male', 'b22ee022@nitm.ac.in', '7005014062', 'Electrical Engineering', '0000-00-00', 0.00),
(245, 'B23CE020', 'Satyam Singh ', 'Male', 'b23ce020@nitm.ac.in', '7752902300', 'Civil Engineering', '0000-00-00', 0.00),
(246, 'B22EE017', 'Rohit Aryan', 'Male', 'b22ee017@nitm.ac.in', '9801735763', 'Electrical Engineering', '0000-00-00', 0.00),
(247, 'B23EC015', 'Sayantika Das', 'Female', 'b23ec015@nitm.ac.in', '8131085260', 'Electronics & Communication', '0000-00-00', 0.00),
(248, 'P22EE001', 'P22EE001', 'Male', 'p22ee001@nitm.ac.in', '8008490029', 'Electrical Engineering', '0000-00-00', 0.00),
(249, 'B24ME028', 'Nishu Lamba ', 'Female', 'b24me028@nitm.ac.in', '8630907840', 'Mechanical Engineering', '0000-00-00', 0.00),
(250, 'P23CY001', 'Krishnandu Dey ', 'Male', 'p23cy001@nitm.ac.in', '8402815130', 'Chemistry', '0000-00-00', 0.00),
(251, 'B23EC009', 'ARUNODAY TIWARI', 'Male', 'b23ec009@nitm.ac.in', '6394093377', 'Electronics & Communication', '0000-00-00', 0.00),
(252, 'B22EE033', 'MD SHAMS TABREZ ANSARI ', 'Male', 'b22ee033@nitm.ac.in', '9431401666', 'Electrical Engineering', '0000-00-00', 0.00),
(253, 'B24EC028', 'Mebandondor Nongneng', 'Male', 'b24ec028@nitm.ac.in', '7630885123', 'Electronics & Communication', '0000-00-00', 0.00),
(254, 'B22CE002', 'Pangkimsrang M Marak', 'Male', 'b22ce002@nitm.ac.in', '9862664586', 'Civil Engineering', '0000-00-00', 0.00),
(255, 'p22cy005', 'Amarjyoti Mondal ', 'Male', 'p22cy005@nitm.ac.in', '7003688565', 'Chemistry', '0000-00-00', 0.00),
(256, 'P22CY007', 'Yadav Manju Siyaram ', 'Female', 'p22cy007@nitm.ac.in', '9730442407', 'Chemistry', '0000-00-00', 0.00),
(257, 'B23ME027', 'chinagudaba nikhil', 'Male', 'b23me027@nitm.ac.in', '9032178545', 'Mechanical Engineering', '0000-00-00', 0.00),
(258, 'P22ME005', 'Shubhamshree Avishek', 'Male', 'p22me005@nitm.ac.in', '7978024098', 'Mechanical Engineering', '0000-00-00', 0.00),
(259, 'p24cb003', 'SATABDI DEBROY', 'Female', 'p24cb003@nitm.ac.in', '8132059127', 'Chemical Engineering', '0000-00-00', 0.00),
(260, 'B22ME021', 'Karan Gupta', 'Male', 'b22me021@nitm.ac.in', '6909046400', 'Mechanical Engineering', '0000-00-00', 0.00),
(261, 'B24CS048', 'PRATHIPATI DHANUSH ', 'Male', 'b24cs048@nitm.ac.in', '7702953504', 'Computer Science', '0000-00-00', 0.00),
(262, 'B22CS032', 'Anjali Ojha', 'Female', 'b22cs032@nitm.ac.in', '7877075397', 'Computer Science', '0000-00-00', 0.00),
(263, 'B22CS003', 'Mohd Ashad Ansari', 'Male', 'b22cs003@nitm.ac.in', '7302080531', 'Computer Science', '0000-00-00', 0.00),
(264, 'B24EE030', 'NIDADHAVOLU RAJESH ', 'Male', 'b24ee030@nitm.ac.in', '7702856188', 'Electrical Engineering', '0000-00-00', 0.00),
(265, 'P24CE001', 'Masud Hussain ', 'Male', 'p24ce001@nitm.ac.in', '8837355760', 'Civil Engineering', '0000-00-00', 0.00),
(266, 'B22ME003 ', 'DONALDSON NONGLANG ', 'Male', 'b22me003@nitm.ac.in', '8730039901', 'Mechanical Engineering', '0000-00-00', 0.00),
(267, 'B23ee031 ', 'Ibanylla M Maring ', 'Female', 'b23ee031@nitm.ac.in', '8837039409', 'Electrical Engineering', '0000-00-00', 0.00),
(268, 'B22CS022', 'Karipireddy Surya Teja Gopal Reddy', 'Male', 'b22cs022@nitm.ac.in', '7396150290', 'Computer Science', '0000-00-00', 0.00),
(269, 'T24CS015', 'SAUCY MUKHIM ', 'Female', 't24cs015@nitm.ac.in', '8119804138', 'Computer Science', '0000-00-00', 0.00),
(270, 'S24PH016', 'Daniel Marwein', 'Male', 's24ph016@nitm.ac.in', '6033182069', 'Physics', '0000-00-00', 0.00),
(271, 'S24CB003', 'KSHITENDU RANJAN MOHANTA', 'Male', 's24cb003@nitm.ac.in', '8249273579', 'Chemical Engineering', '0000-00-00', 0.00),
(272, 'B22ME015', 'OM PRAKASH YADAV', 'Male', 'b22me025@nitm.ac.in', '7569671548', 'Mechanical Engineering', '0000-00-00', 0.00),
(273, 'B24ME016 ', 'Leonardo Davince Sangriang', 'Male', 'b24me016@nitm.ac.in', '8798553738', 'Mechanical Engineering', '0000-00-00', 0.00),
(274, 'p22me008', 'Satish Chaurasia', 'Male', 'p22me008@nitm.ac.in', '9015645619', 'Mechanical Engineering', '0000-00-00', 0.00),
(275, 'B22CS035', 'Gunnu Lavanya', 'Female', 'b22cs035@nitm.ac.in', '8919169473', 'Computer Science', '0000-00-00', 0.00),
(276, 'T24CS007', 'Anushka Sarkar', 'Female', 't24cs007@nitm.ac.in', '948762651', 'Computer Science', '0000-00-00', 0.00),
(277, 'b23me001', 'AMIYA RATAN RAY', 'Male', 'b23me001@nitm.ac.in', '6033389825', 'Mechanical Engineering', '0000-00-00', 0.00),
(278, 'B22ME004', 'Gaurav Joshi', 'Male', 'b22me004@nitm.ac.in', '8415031939', 'Mechanical Engineering', '0000-00-00', 0.00),
(279, 'S24MA001', 'Mathoi Ningombam', 'Female', 's24ma001@nitm.ac.in', '9366697536', 'Mathematics', '0000-00-00', 0.00),
(280, 'B24CE013', 'Insanhame vivian Lyngdoh', 'Male', 'b24ce013@nitm.ac.in', '9362690709', 'Civil Engineering', '0000-00-00', 0.00),
(281, 'B22EC031', 'Davala venu gopala krishna', 'Male', 'b22ec031@nitm.ac.in', '9963442677', 'Electronics & Communication', '0000-00-00', 0.00),
(282, 'P21EC008', 'Menuvolu Tetseo', 'Female', 'p21ec008@nitm.ac.in', '9089668029', 'Electronics & Communication', '0000-00-00', 0.00),
(283, 'P24PH003', 'SANI KUMAR BAISHYA', 'Male', 'p24ph003@nitm.ac.in', '9678334807', 'Physics', '0000-00-00', 0.00),
(284, 'T24CS016', 'WALLAMBOK RANI', 'Male', 't24cs016@nitm.ac.in', '9089393120', 'Computer Science', '0000-00-00', 0.00),
(285, 'B24EE025', 'Amit Kumar ', 'Male', 'b24ee025@nitm.ac.in', '7428143406', 'Electrical Engineering', '0000-00-00', 0.00),
(286, 'B24EC023 ', 'RAHUL KUMAR ', 'Male', 'b24ec023@nitm.ac.in', '7857829756', 'Electronics & Communication', '0000-00-00', 0.00),
(287, 'B24EC026', 'Amit Kuri ', 'Male', 'b24ec026@nitm.ac.in', '7014267799', 'Electronics & Communication', '0000-00-00', 0.00),
(288, 'B22CE016', 'L Komune ', 'Female', 'b22ce016@nitm.ac.in', '8974530717', 'Civil Engineering', '0000-00-00', 0.00),
(289, 'B22ME013', 'Tiyangsen Lemtor', 'Female', 'b22me013@nitm.ac.in', '9366863513', 'Mechanical Engineering', '0000-00-00', 0.00),
(290, 'B22EE014 ', 'Brandon Kupar Shullai ', 'Male', 'b22ee014@nitm.ac.in', '9612667350', 'Electrical Engineering', '0000-00-00', 0.00),
(291, 'B24EE022', 'Abhay Mishra ', 'Male', 'b24ee022@nitm.ac.in', '9863597467', 'Electrical Engineering', '0000-00-00', 0.00),
(292, 'B24EC020', 'Boilla Akshith Reddy', 'Male', 'b24ec020@nitm.ac.in', '9347979589', 'Electronics & Communication', '0000-00-00', 0.00),
(293, 'B24EC003', 'Shivam Das ', 'Male', 'b24ec003@nitm.ac.in', '7762028620', 'Electronics & Communication', '0000-00-00', 0.00),
(294, 'B24EC024', 'AJIT HAJONG ', 'Male', 'b24ec024@nitm.ac.in', '9362746996', 'Electronics & Communication', '0000-00-00', 0.00),
(295, 'b24ec016', 'Jason Badapkupar Marbaniang', 'Male', 'b24ec016@nitm.ac.in', '8787571796', 'Electronics & Communication', '0000-00-00', 0.00),
(296, 'B24CS012 ', 'Rohit Das', 'Male', 'b24cs012@nitm.ac.in', '6909529569', 'Computer Science', '0000-00-00', 0.00),
(297, 'B24EC035', 'Aditya Kumar Thakur ', 'Male', 'b24ec035@nitm.ac.in', '9608196624', 'Electronics & Communication', '0000-00-00', 0.00),
(298, 'B24EE027', 'Aman Gusain', 'Male', 'b24ee027@nitm.ac.in', '9910871218', 'Electrical Engineering', '0000-00-00', 0.00),
(299, 'B24EC008', 'Damebanhun Thongni', 'Male', 'b24ec008@nitm.ac.in', '6009735939', 'Electronics & Communication', '0000-00-00', 0.00),
(300, 'B23EC022', 'Abhay Kumar ', 'Male', 'b23ec022@nitm.ac.in', '9430896840', 'Electronics & Communication', '0000-00-00', 0.00),
(301, 'B24EC001', 'Jyotishman Bhattacharjee', 'Male', 'b24ec001@nitm.ac.in', '9436731631', 'Electronics & Communication', '0000-00-00', 0.00),
(302, 'B24EC030', 'Valluri Venkata Mohan Kumar ', 'Male', 'b24ec030@nitm.ac.in', '9391124405', 'Electronics & Communication', '0000-00-00', 0.00),
(303, 'B24EC018', 'Gurubelli Chakradhar ', 'Male', 'b24ec018@nitm.ac.in', '7981511449', 'Electronics & Communication', '0000-00-00', 0.00),
(304, 'B24CS028', 'Preetam Kumar Pandey ', 'Male', 'b24cs028@nitm.ac.in', '9670405605', 'Computer Science', '0000-00-00', 0.00),
(305, 'B24EC010', 'Balajied Tympuin ', 'Male', 'b24ec010@nitm.ac.in', '9366707744', 'Electronics & Communication', '0000-00-00', 0.00),
(306, 'B24ME026 ', 'MEBANTEI JABA', 'Male', 'b24me026@nitm.ac.in', '9362913246', 'Mechanical Engineering', '0000-00-00', 0.00),
(307, 'B23CS008', 'Anupam Aanand', 'Male', 'b23cs008@nitm.ac.in', '9142249872', 'Computer Science', '0000-00-00', 0.00),
(308, 'B24EE006', 'Seintre Chyrmang ', 'Male', 'b24ee006@nitm.ac.in', '6033183992', 'Electrical Engineering', '0000-00-00', 0.00),
(309, 'S24PH010', 'Isha Shrivastava ', 'Female', 's24ph010@nitm.ac.in', '8853957925', 'Physics', '0000-00-00', 0.00),
(310, 'B24CE027 ', 'Harish Meena ', 'Male', 'b24ce027@nitm.ac.in', '9079987194', 'Civil Engineering', '0000-00-00', 0.00),
(311, 'B24EC032', 'ANINDYA NANDY ARNAB', 'Male', 'b24ec032@nitm.ac.in', '8132907298', 'Electronics & Communication', '0000-00-00', 0.00),
(312, 'P22CE003', 'TEIBORLANG WARJRI', 'Male', 'p22ce003@nitm.ac.in', '9436483411', 'Civil Engineering', '0000-00-00', 0.00),
(313, 'B23CS041', 'Raunak Prabhakar ', 'Male', 'b23cs041@nitm.ac.in', '8210167230', 'Computer Science', '0000-00-00', 0.00),
(314, 'B23CE008', 'Deisica Marbaniang', 'Female', 'b23ce008@nitm.ac.in', '9362050589', 'Civil Engineering', '0000-00-00', 0.00),
(315, 'S24PH008 ', 'Rahul Sah', 'Male', 's24ph008@nitm.ac.in', '7005517756', 'Physics', '0000-00-00', 0.00),
(316, 'B23ME026', 'Abhishek Kumar Chauhan ', 'Male', 'b23me026@nitm.ac.in', '9170599668', 'Mechanical Engineering', '0000-00-00', 0.00),
(317, 'B24EC004', 'Abrian Tengku R Sangma', 'Male', 'b24ec004@nitm.ac.in', '6002623304', 'Electronics & Communication', '0000-00-00', 0.00),
(318, 'B22EC024', 'Taruna Banola', 'Female', 'b22ec024@nitm.ac.in', '8172942003', 'Electronics & Communication', '0000-00-00', 0.00),
(319, 'b23me005', 'Aastha Mishra', 'Male', 'b23me005@nitm.ac.in', '9335438592', 'Mechanical Engineering', '0000-00-00', 0.00),
(320, 'B22EC015', 'Pasumarthi Sri Tanay Nagamani Kumar ', 'Male', 'b22ec015@nitm.ac.in', '7005169345', 'Electronics & Communication', '0000-00-00', 0.00),
(321, 'B24ee004', 'Rahul Prasad ', 'Male', 'b24ee004@nitm.ac.in', '7005307932', 'Electrical Engineering', '0000-00-00', 0.00),
(322, 'B23EC006', 'Abhinav Hajong', 'Male', 'b23ec006@nitm.ac.in', '6009152137', 'Electronics & Communication', '0000-00-00', 0.00),
(323, 'B23EE014 ', 'Vishnu Kumar ', 'Male', 'b23ee014@nitm.ac.in', '7255963562', 'Electrical Engineering', '0000-00-00', 0.00),
(324, 'B22ME023', 'JUBIN LYNGDOH', 'Male', 'b22me023@nitm.ac.in', '9612360328', 'Mechanical Engineering', '0000-00-00', 0.00),
(325, 'B22CS029', 'Samiksha Deb', 'Female', 'b22cs029@nitm.ac.in', '9863006313', 'Computer Science', '0000-00-00', 0.00),
(326, 'T24CS002', 'Tanishq Sasmal', 'Female', 't24cs002@nitm.ac.in', '7439252034', 'Computer Science', '0000-00-00', 0.00),
(327, 'B22CS025 ', 'Ethaneal McKenzie Basaiawmoit ', 'Male', 'b22cs025@nitm.ac.in', '8259940524', 'Computer Science', '0000-00-00', 0.00),
(328, 'B23EE003', 'Rohan Patil', 'Male', 'b23ee003@nitm.ac.in', '8411912987', 'Electrical Engineering', '0000-00-00', 0.00),
(329, 'p22ee010', 'Liza Debbarma', 'Female', 'p22ee010@nitm.ac.in', '8787310285', 'Electrical Engineering', '0000-00-00', 0.00),
(330, 'B23ME013', 'JITTA CHANDRA SEKHAR ', 'Male', 'b23me013@nitm.ac.in', '8309892125', 'Mechanical Engineering', '0000-00-00', 0.00),
(331, 'P22CE002', 'Aakash Kumar', 'Male', 'p22ce002@nitm.ac.in', '8109466731', 'Civil Engineering', '0000-00-00', 0.00),
(332, 't24ee004 ', 'Beready Devis Marwein ', 'Female', 't24ee004@nitm.ac.in', '7628969916', 'Electrical Engineering', '0000-00-00', 0.00),
(333, 'B24EE009 ', 'Himkydame Sun ', 'Male', 'b24ee009@nitm.ac.in', '8119802492', 'Electrical Engineering', '0000-00-00', 0.00),
(334, 'B22CE020', 'Rahul Kumar ', 'Male', 'b22ce020@nitm.ac.in', '7779951065', 'Civil Engineering', '0000-00-00', 0.00),
(335, 'B23CS030', 'Gladia Mehiwaeka Slong', 'Female', 'b23cs030@nitm.ac.in', '7638916143', 'Computer Science', '0000-00-00', 0.00),
(336, 'S24ma014', 'Harsh Pandey ', 'Male', 's24ma014@nitm.ac.in', '9696270467', 'Mathematics', '0000-00-00', 0.00),
(337, 'B22CS026', 'Prem Kumar Gupta', 'Male', 'b22cs026@nitm.ac.in', '7629800431', 'Computer Science', '0000-00-00', 0.00),
(338, 'B22EC030', 'Debashish Nayak', 'Male', 'b22ec030@nitm.ac.in', '6009331164', 'Electronics & Communication', '0000-00-00', 0.00),
(339, 'T24CS020', 'Plabana Saud', 'Female', 't24cs020@nitm.ac.in', '6900275427', 'Computer Science', '0000-00-00', 0.00),
(340, 'T24EC001', 'Mohit raj', 'Male', 't24ec001@nitm.ac.in', '9918779255', 'Electronics & Communication', '0000-00-00', 0.00),
(341, 'B24CS011 ', 'AJAY RAJ YADAV ', 'Male', 'b24cs011@nitm.ac.in', '8787535299', 'Computer Science', '0000-00-00', 0.00),
(342, 'P22CE005', 'Sahil Pritam Swain', 'Male', 'p22ce005@nitm.ac.in', '9439719978', 'Civil Engineering', '0000-00-00', 0.00),
(343, 'B23CS011', 'Priyanshu Singh ', 'Male', 'b23cs011@nitm.ac.in', '8433434103', 'Computer Science', '0000-00-00', 0.00),
(344, 'p22cs003', 'Namrata Govind Ambekar', 'Female', 'p22cs003@nitm.ac.in', '7721807445', 'Computer Science', '0000-00-00', 0.00),
(345, 'P24PH001', 'Tushar Bhattacharjee', 'Male', 'p24ph001@nitm.ac.in', '7640950916', 'Physics', '0000-00-00', 0.00),
(346, 'B24EE024', 'Giftyfulmerry Nongbak', 'Female', 'b24ee024@nitm.ac.in', '9366249242', 'Electrical Engineering', '0000-00-00', 0.00),
(347, 'T24EC006 ', 'MARBUD JANAI SUN', 'Male', 't24ec006@nitm.ac.in', '9366646032', 'Electronics & Communication', '0000-00-00', 0.00),
(348, 'B23ee021 ', 'Ibanrisha Madur ', 'Female', 'b23ee021@nitm.ac.in', '9863745715', 'Electrical Engineering', '0000-00-00', 0.00),
(349, 'B22ME007 ', 'Bojja Jaswanth ', 'Male', 'b22me007@nitm.ac.in', '9550079353', 'Mechanical Engineering', '0000-00-00', 0.00),
(350, 'B24CE010', 'PROBHAS MONDAL ', 'Male', 'b24ce010@nitm.ac.in', '7679949979', 'Civil Engineering', '0000-00-00', 0.00),
(351, 'P21EC007', 'Debaraj Rana', 'Male', 'p21ec007@nitm.ac.in', '9861232210', 'Electronics & Communication', '0000-00-00', 0.00),
(352, 'B22ME027 ', 'Himanshu Kumar Jha', 'Male', 'b22me027@nitm.ac.in', '7905086797', 'Mechanical Engineering', '0000-00-00', 0.00),
(353, 'P22ME001', 'EUSEBIOUS THEODYNOSIOUS CHULLAI', 'Male', 'p22me001@nitm.ac.in', '8681047927', 'Mechanical Engineering', '0000-00-00', 0.00),
(354, 'B23ECO18 ', 'Kurra Nandini ', 'Female', 'b23ec018@nitm.ac.in', '9346398001', 'Electronics & Communication', '0000-00-00', 0.00),
(355, 'B22ME032 ', 'Sumit kumar ', 'Male', 'b22me032@nitm.ac.in', '8757577743', 'Mechanical Engineering', '0000-00-00', 0.00),
(356, 'P2PH001', 'Athul Satya', 'Female', 'p22ph001@nitm.ac.in', '9946948760', 'Physics', '0000-00-00', 0.00),
(357, 'S24PH004', 'Meshanskhem Ryntathiang', 'Male', 's24ph004@nitm.ac.in', '9863718054', 'Physics', '0000-00-00', 0.00),
(358, 'B23ec037 ', 'Mukesh Kumar ', 'Male', 'b23ec037@nitm.ac.in', '7061535917', 'Electronics & Communication', '0000-00-00', 0.00),
(359, 'b23ec026', 'Vattimilli Divya Sree ', 'Female', 'b23ec026@nitm.ac.in', '9618915718', 'Electronics & Communication', '0000-00-00', 0.00),
(360, 'B22EC026 ', 'Santa Mary Khyriemmujat ', 'Female', 'b22ec026@nitm.ac.in', '7005749081', 'Electronics & Communication', '0000-00-00', 0.00),
(361, 'B24CS005', 'Emitre Kyndiah', 'Male', 'b24cs005@nitm.ac.in', '8787529268', 'Computer Science', '0000-00-00', 0.00),
(362, 'B23ME023', 'Sabhavat Sandeep ', 'Male', 'b23me023@nitm.ac.in', '6305349006', 'Mechanical Engineering', '0000-00-00', 0.00),
(363, 'B23EE018', 'Surabani Rani ', 'Female', 'b23ee018@nitm.ac.in', '8798530280', 'Electrical Engineering', '0000-00-00', 0.00),
(364, 'B23ME028', 'Arush Raman', 'Male', 'b23me028@nitm.ac.in', '7303618662', 'Mechanical Engineering', '0000-00-00', 0.00),
(365, 'B23CS021 ', 'Shivam Pratap Singh ', 'Male', 'b23cs021@nitm.ac.in', '9193496575', 'Computer Science', '0000-00-00', 0.00),
(366, 'S24CB015', 'Naphisabeth Marthong', 'Female', 's24cb015@nitm.ac.in', '8413075414', 'Chemical Engineering', '0000-00-00', 0.00),
(367, 'B24ME018 ', 'Dunstan Johannan Gympad ', 'Male', 'b24me018@nitm.ac.in', '9436456442', 'Mechanical Engineering', '0000-00-00', 0.00),
(368, 'P24CB004 ', 'Roohi Choudhury ', 'Female', 'p24cb004@nitm.ac.in', '6901978449', 'Chemical Engineering', '0000-00-00', 0.00),
(369, '22105011', 'Thangkholal Haokip ', 'Male', '22105011@nitm.ac.in', '6909162473', 'General', '0000-00-00', 0.00),
(370, 'P22CS004', 'Rakesh Kumar Gupta ', 'Male', 'p22cs004@nitm.ac.in', '8910469361', 'Computer Science', '0000-00-00', 0.00),
(371, 'P23MA002', 'Sanchita Pramanik', 'Female', 'p23ma002@nitm.ac.in', '6297574458', 'Mathematics', '0000-00-00', 0.00),
(372, 'B23cs034', 'Ngachamsung Jagoi', 'Male', 'b23cs034@nitm.ac.in', '6009585151', 'Computer Science', '0000-00-00', 0.00),
(373, 'p22ce001', 'Badavath Naveen', 'Male', 'p22ce001@nitm.ac.in', '8367235025', 'Civil Engineering', '0000-00-00', 0.00),
(374, 'T24EE002', 'Balbareen Kurkalang', 'Female', 't24ee002@nitm.ac.in', '8731839521', 'Electrical Engineering', '0000-00-00', 0.00),
(375, 'B24CE011', 'Sourav Beniwal ', 'Male', 'b24ce011@nitm.ac.in', '7073623101', 'Civil Engineering', '0000-00-00', 0.00),
(376, 'P24CS007', 'Samrat Sarkar', 'Male', 'p24cs007@nitm.ac.in', '8630035321', 'Computer Science', '0000-00-00', 0.00),
(377, 'B23CS012', 'Koyel Kalita', 'Female', 'b23cs012@nitm.ac.in', '9862891766', 'Computer Science', '0000-00-00', 0.00),
(378, 'P20PH002', 'Onus Manner', 'Male', 'p20ph002@nitm.ac.in', '8256946862', 'Physics', '0000-00-00', 0.00),
(379, 'B24CS047 ', 'Sonam Kumari', 'Female', 'b24cs047@nitm.ac.in', '8271733178', 'Computer Science', '0000-00-00', 0.00),
(380, 's24cb009 ', 'Sahil Anurag ', 'Male', 's24cb009@nitm.ac.in', '8260835061', 'Chemical Engineering', '0000-00-00', 0.00),
(381, 'S24MA002 ', 'NAPHIBAIAR NONGREM ', 'Female', 's24ma002@nitm.ac.in', '9862887486', 'Mathematics', '0000-00-00', 0.00),
(382, 'B22CS010', 'Manadapbiang Mawlieh', 'Male', 'b22cs010@nitm.ac.in', '9863730357', 'Computer Science', '0000-00-00', 0.00),
(383, 'T24CS013', 'Divyodeep Chowdhury', 'Male', 't24cs013@nitm.ac.in', '6909115441', 'Computer Science', '0000-00-00', 0.00),
(384, 'P22ME007', 'Ankit Dhar Dubey', 'Male', 'p22me007@nitm.ac.in', '9643021194', 'Mechanical Engineering', '0000-00-00', 0.00),
(385, 'B23EE005', 'Adharsh Barman ', 'Male', 'b23ee005@nitm.ac.in', '9366596335', 'Electrical Engineering', '0000-00-00', 0.00),
(386, 'B23cs002', 'Anshuiya Karki', 'Female', 'b23cs002@nitm.ac.in', '7640841355', 'Computer Science', '0000-00-00', 0.00),
(387, 'P22cs001', 'Anushka chaurasia ', 'Female', 'p22cs001@nitm.ac.in', '8573000074', 'Computer Science', '0000-00-00', 0.00),
(388, 'B23CS033', 'Aditya Singh', 'Male', 'b23cs033@nitm.ac.in', '9205789950', 'Computer Science', '0000-00-00', 0.00),
(389, 'B24cs033', 'Bhabishya Paudel ', 'Male', 'b24cs033@nitm.ac.in', '8787527098', 'Computer Science', '0000-00-00', 0.00),
(390, 'B22CS002', 'Amartya Ghosh', 'Male', 'b22cs002@nitm.ac.in', '7093854769', 'Computer Science', '0000-00-00', 0.00),
(391, 'P24ec010', 'Dhiraj Kumar', 'Male', 'p24ec010@nitm.ac.in', '8825281415', 'Electronics & Communication', '0000-00-00', 0.00),
(392, 'B22CS030', 'Shembha Nylla Phin', 'Female', 'b22cs030@nitm.ac.in', '9402349788', 'Computer Science', '0000-00-00', 0.00),
(393, 'B23EE009 ', 'Ritu Ranjan ', 'Female', 'b23ee009@nitm.ac.in', '7488562414', 'Electrical Engineering', '0000-00-00', 0.00);
INSERT INTO `students` (`id`, `student_id`, `name`, `Gender`, `email`, `phone`, `department`, `dob`, `total_costs`) VALUES
(394, 'B22EE003', 'Bhaskar Das ', 'Male', 'b22ee003@nitm.ac.in', '8415948890', 'Electrical Engineering', '0000-00-00', 0.00),
(395, 'S24PH021', 'Sebastian Singnar', 'Male', 's24ph021@nitm.ac.in', '9365679144', 'Physics', '0000-00-00', 0.00),
(396, 'B23CE023', 'Mewantei S. Marbaniang', 'Male', 'b23ce023@nitm.ac.in', '7642826701', 'Civil Engineering', '0000-00-00', 0.00),
(397, 'B22CS028', 'Thumu Rakesh Srikar Reddy ', 'Male', 'b22cs028@nitm.ac.in', '9963864260', 'Computer Science', '0000-00-00', 0.00),
(398, 'B23EC038', 'Harchelle R. Sangma', 'Male', 'b23ec038@nitm.ac.in', '6009061289', 'Electronics & Communication', '0000-00-00', 0.00),
(399, 'B23CS014', 'Purushottam Thakur ', 'Male', 'b23cs014@nitm.ac.in', '7070384853', 'Computer Science', '0000-00-00', 0.00),
(400, 'B23EC008', 'Khushi Kumari ', 'Female', 'b23ec008@nitm.ac.in', '8581014755', 'Electronics & Communication', '0000-00-00', 0.00),
(401, 'T24CS001', 'Ritvik Sharma', 'Male', 't24cs001@nitm.ac.in', '9205257107', 'Computer Science', '0000-00-00', 0.00),
(402, 'B23CS038', 'Aman kumar', 'Male', 'b23cs038@nitm.ac.in', '9905464703', 'Computer Science', '0000-00-00', 0.00),
(403, 'P23CY004', 'Mitul Kalita', 'Male', 'p23cy004@nitm.ac.in', '8638588734', 'Chemistry', '0000-00-00', 0.00),
(404, 'S24cb001 ', 'Ankur kakati', 'Male', 's24cb001@nitm.ac.in', '9101747880', 'Chemical Engineering', '0000-00-00', 0.00),
(405, 'P22CY003', 'Sana Quraishi', 'Female', 'p22cy003@nitm.ac.in', '9366538051', 'Chemistry', '0000-00-00', 0.00),
(406, 'B22EE011 ', 'Meba Aihun Kharkongor ', 'Female', 'b22ee011@nitm.ac.in', '8414976845', 'Electrical Engineering', '0000-00-00', 0.00),
(407, 'B24EE014 ', 'Wanbhalang Lyngdoh Nongbri ', 'Male', 'b24ee014@nitm.ac.in', '9077821728', 'Electrical Engineering', '0000-00-00', 0.00),
(408, 'B24CE023', 'Sengatchi M Sangma ', 'Female', 'b24ce023@nitm.ac.in', '9366197320', 'Civil Engineering', '0000-00-00', 0.00),
(409, 'B23EC007', 'Dean Chisam T Sangma ', 'Male', 'b23ec007@nitm.ac.in', '7085109767', 'Electronics & Communication', '0000-00-00', 0.00),
(410, 'B24CE029', 'Iainehskhem Lyndem ', 'Male', 'b24ce029@nitm.ac.in', '9863916586', 'Civil Engineering', '0000-00-00', 0.00),
(411, 'B22EC033', 'Rimitre Shanpru ', 'Male', 'b22ec033@nitm.ac.in', '8259052843', 'Electronics & Communication', '0000-00-00', 0.00),
(412, 'B22EE007 ', 'Ujjawal Jhajharia ', 'Male', 'b22ee007@nitm.ac.in', '8690539381', 'Electrical Engineering', '0000-00-00', 0.00),
(413, 'B24CS006 ', 'Rishab Mankotia Synjri ', 'Male', 'b24cs006@nitm.ac.in', '9863475903', 'Computer Science', '0000-00-00', 0.00),
(414, 'B24CS046', 'Swarnim Suman', 'Female', 'b24cs046@nitm.ac.in', '8416009558', 'Computer Science', '0000-00-00', 0.00),
(415, 'B24CS030', 'B Dharun', 'Male', 'b24cs030@nitm.ac.in', '7019493518', 'Computer Science', '0000-00-00', 0.00),
(416, 'P24CB002 ', 'Nisha Basumatari ', 'Female', 'p24cb002@nitm.ac.in', '8811009925', 'Chemical Engineering', '0000-00-00', 0.00),
(417, 'B23CE025', 'NAKALASENGKYRHAI LYNGDOH KYNSHI', 'Female', 'b23ce025@nitm.ac.in', '7005590494', 'Civil Engineering', '0000-00-00', 0.00),
(418, 'T24me005', 'Lastbornson Syngkon ', 'Male', 't24me005@nitm.ac.in', '9366201699', 'Mechanical Engineering', '0000-00-00', 0.00),
(419, 'B23EC023', 'Mandapalli Sreekar Prasad', 'Male', 'b23ec023@nitm.ac.in', '9346597289', 'Electronics & Communication', '0000-00-00', 0.00),
(420, 'B24CE006 ', 'Minami Dilsanchi Ch Momin ', 'Female', 'b24ce006@nitm.ac.in', '8798593916', 'Civil Engineering', '0000-00-00', 0.00),
(421, 'B23CE004', 'Biandik Biachisa D Sangma', 'Female', 'b23ce004@nitm.ac.in', '9366566010', 'Civil Engineering', '0000-00-00', 0.00),
(422, 'P22PH003', 'Vivekanand Mohapatra', 'Male', 'p22ph003@nitm.ac.in', '6009262157', 'Physics', '0000-00-00', 0.00),
(423, 'T24CS009', 'Rahil Agarwal', 'Male', 't24cs009@nitm.ac.in', '8099537350', 'Computer Science', '0000-00-00', 0.00),
(424, 'B23CE026', 'Saksham', 'Male', 'b23ce026@nitm.ac.in', '6398009117', 'Civil Engineering', '0000-00-00', 0.00),
(425, 'B23ME003', 'Alfred lalhruaitluanga Pautu', 'Male', 'b23me003@nitm.ac.in', '7005841612', 'Mechanical Engineering', '0000-00-00', 0.00),
(426, 'B23CE015', 'Binnada Yamuna ', 'Female', 'b23ce015@nitm.ac.in', '7416701872', 'Civil Engineering', '0000-00-00', 0.00),
(427, 'B22CS033 ', 'T Vikram Rathod ', 'Male', 'b22cs033@nitm.ac.in', '9014500678', 'Computer Science', '0000-00-00', 0.00),
(428, 'T24CS008', 'Sohonsagar Singha', 'Male', 't24cs008@nitm.ac.in', '9394355575', 'Computer Science', '0000-00-00', 0.00),
(429, 'P21EC005', 'Seenivasan M A', 'Male', 'p21ec005@nitm.ac.in', '9962224603', 'Electronics & Communication', '0000-00-00', 0.00),
(430, 'P22EC013', 'Jacinta Jyrwa', 'Female', 'p22ec013@nitm.ac.in', '9436762199', 'Electronics & Communication', '0000-00-00', 0.00),
(431, 'B24CE003', 'Jeffer Nelson Syiemlieh', 'Male', 'b24ce003@nitm.ac.in', '9863108417', 'Civil Engineering', '0000-00-00', 0.00),
(432, 'B22CS037', 'Vanshika Sarraf', 'Female', 'b22cs037@nitm.ac.in', '8102393008', 'Computer Science', '0000-00-00', 0.00),
(433, 'S24cb013', 'Ibanrikynti Sun ', 'Female', 's24cb013@nitm.ac.in', '8119804930', 'Chemical Engineering', '0000-00-00', 0.00),
(434, 'B22EE025', 'Shaik Nabeel ', 'Male', 'b22ee025@nitm.ac.in', '6281748659', 'Electrical Engineering', '0000-00-00', 0.00),
(435, 'B22CE032', 'Dathrangki Shylla', 'Male', 'b22ce032@nitm.ac.in', '9612956213', 'Civil Engineering', '0000-00-00', 0.00),
(436, 'B24ME020', 'Gugulothu Tejaswi ', 'Female', 'b24me020@nitm.ac.in', '9490773927', 'Mechanical Engineering', '0000-00-00', 0.00),
(437, 's24cb006', 'Twinkle Dekaraja ', 'Male', 's24cb006@nitm.ac.in', '6900711937', 'Chemical Engineering', '0000-00-00', 0.00),
(438, 'T24EC011', 'Saumy Datt', 'Male', 't24ec011@nitm.ac.in', '9473442664', 'Electronics & Communication', '0000-00-00', 0.00),
(439, 'B23CE028 ', 'Saloni Singh', 'Female', 'b23ce028@nitm.ac.in', '6291676017', 'Civil Engineering', '0000-00-00', 0.00),
(440, 'B22EE019', 'Hashua Banlam Warr Phira', 'Male', 'b22ee019@nitm.ac.in', '9863599616', 'Electrical Engineering', '0000-00-00', 0.00),
(441, 'T24EE005', 'EUGENIA QWYNETH WAR ', 'Female', 't24ee005@nitm.ac.in', '8794516218', 'Electrical Engineering', '0000-00-00', 0.00),
(442, 'S24CB018', 'Eurasa Bareh', 'Female', 's24cb018@nitm.ac.in', '8794431542', 'Chemical Engineering', '0000-00-00', 0.00),
(443, 'B24ME005 ', 'Damandap Jyrwa ', 'Male', 'b24me005@nitm.ac.in', '9077327696', 'Mechanical Engineering', '0000-00-00', 0.00),
(444, 'B22EC029 ', 'Debasmita Chakraborty ', 'Female', 'b22ec029@nitm.ac.in', '8131853424', 'Electronics & Communication', '0000-00-00', 0.00),
(445, 'B23EC012', 'Ankit Raj', 'Male', 'b23ec012@nitm.ac.in', '9436940683', 'Electronics & Communication', '0000-00-00', 0.00),
(446, 'B23CS035', 'Austin Joel Dympep ', 'Male', 'b23cs035@nitm.ac.in', '7005612597', 'Computer Science', '0000-00-00', 0.00),
(447, '22105013', 'Jangzemin Haokip ', 'Male', '22105013@nitm.ac.in', '6009805098', 'General', '0000-00-00', 0.00),
(448, 'P21CY001', 'Ria Deb', 'Female', 'p21cy001@nitm.ac.in', '8486389181', 'Chemistry', '0000-00-00', 0.00),
(449, 'B23EC025 ', 'Pawan Tigga ', 'Male', 'b23ec025@nitm.ac.in', '7488401716', 'Electronics & Communication', '0000-00-00', 0.00),
(450, 'B22EC023 ', 'K Akshara Reddy', 'Female', 'b22ec023@nitm.ac.in', '8639045076', 'Electronics & Communication', '0000-00-00', 0.00),
(451, 'B22ME026', 'Satyam Kumar Singh', 'Male', 'b22me026@nitm.ac.in', '7024449869', 'Mechanical Engineering', '0000-00-00', 0.00),
(452, 'P22PH002', 'Dhruv Agrawal', 'Male', 'p22ph002@nitm.ac.in', '9532255083', 'Physics', '0000-00-00', 0.00),
(453, 'B22CE028', 'Balajee Kanhaiya ', 'Male', 'b22ce028@nitm.ac.in', '7004607761', 'Civil Engineering', '0000-00-00', 0.00),
(454, 'P22CY002', 'Sadia Nudrat', 'Female', 'p22cy002@nitm.ac.in', '7005226776', 'Chemistry', '0000-00-00', 0.00),
(455, 'P23EC001', 'HABANAIBOK SUTING ', 'Male', 'p23ec001@nitm.ac.in', '6009691851', 'Electronics & Communication', '0000-00-00', 0.00),
(456, 'P22PH006', 'DHIRAJ SARMA', 'Male', 'p22ph006@nitm.ac.in', '8822798675', 'Physics', '0000-00-00', 0.00),
(457, 'P21cs013', 'Ch Sree Kumar', 'Male', 'p21cs013@nitm.ac.in', '8658021929', 'Computer Science', '0000-00-00', 0.00),
(458, 'p22cy001', 'Plabon Saikia', 'Male', 'p22cy001@nitm.ac.in', '8638921187', 'Chemistry', '0000-00-00', 0.00),
(459, 'P22PH009', 'Sandeep Ghosh', 'Male', 'p22ph009@nitm.ac.in', '7888408933', 'Physics', '0000-00-00', 0.00),
(460, 'P24CS006', 'Russell Cooper Banks', 'Male', 'p24cs006@nitm.ac.in', '8416023217', 'Computer Science', '0000-00-00', 0.00),
(461, 'p22me006', 'Omkar Raj Aryan', 'Male', 'p22me006@nitm.ac.in', '8800679475', 'Mechanical Engineering', '0000-00-00', 0.00),
(462, 'B24CE017', 'Bankyntiew Shaphrang Rajee', 'Male', 'b24ce017@nitm.ac.in', '8974501304', 'Civil Engineering', '0000-00-00', 0.00),
(463, 'P23CE001', 'Rinaldo Snaitang', 'Male', 'p23ce001@nitm.ac.in', '8787794231', 'Civil Engineering', '0000-00-00', 0.00),
(464, 'P22EC005', 'Hemant Kumari', 'Female', 'p22ec005@nitm.ac.in', '9098280070', 'Electronics & Communication', '0000-00-00', 0.00),
(465, 'S24ph013', 'Ibahunshisha kharsati ', 'Female', 's24ph013@nitm.ac.in', '8731970775', 'Physics', '0000-00-00', 0.00),
(466, 'B24CE004 ', 'JERREMILD TARIANG ', 'Male', 'b24ce004@nitm.ac.in', '9233326127', 'Civil Engineering', '0000-00-00', 0.00),
(467, 'B23ME007', 'Alympa Deka', 'Female', 'b23me007@nitm.ac.in', '7002895626', 'Mechanical Engineering', '0000-00-00', 0.00),
(468, 'P19ME018', 'Arunabh Choudhury ', 'Male', 'arunabhchoudhury@nitm.ac.in', '9435304858', 'Mechanical Engineering', '0000-00-00', 0.00),
(469, 'P24CB001', 'MARRY HAZARIKA', 'Female', 'p24cb001@nitm.ac.in', '7002589295', 'Chemical Engineering', '0000-00-00', 0.00),
(470, 'P21CY002', 'Pulakesh Gogoi', 'Male', 'p21cy002@nitm.ac.in', '8761978060', 'Chemistry', '0000-00-00', 0.00),
(471, 'B23CS027', 'Navnit sawarn ', 'Male', 'b23cs027@nitm.ac.in', '7209975562', 'Computer Science', '0000-00-00', 0.00),
(472, 'P22MA007', 'Dibyasman Sarma', 'Male', 'p22ma007@nitm.ac.in', '6000797715', 'Mathematics', '0000-00-00', 0.00),
(473, 'B23ME018', 'Gourav Kumar ', 'Male', 'b23me018@nitm.ac.in', '6033171246', 'Mechanical Engineering', '0000-00-00', 0.00),
(474, 'P21ME006', 'Ashish Babarao Khelkar', 'Male', 'p21me006@nitm.ac.in', '9158709313', 'Mechanical Engineering', '0000-00-00', 0.00),
(475, 'B23EE023 ', 'Prashant Kumar ', 'Male', 'b23ee023@nitm.ac.in', '9548403161', 'Electrical Engineering', '0000-00-00', 0.00),
(476, 'P22EC006', 'MANDIRA BISWAS', 'Female', 'p22ec006@nitm.ac.in', '8974182364', 'Electronics & Communication', '0000-00-00', 0.00),
(477, 'B23CE001 ', 'DOLA RAGHU ', 'Male', 'b23ce001@nitm.ac.in', '7670854044', 'Civil Engineering', '0000-00-00', 0.00),
(478, 'B23EE013', 'Parag Das', 'Male', 'b23ee013@nitm.ac.in', '9091967170', 'Electrical Engineering', '0000-00-00', 0.00),
(479, 'B23CS007', 'Indra Shikhar Sharma ', 'Male', 'b23cs007@nitm.ac.in', '6397751645', 'Computer Science', '0000-00-00', 0.00),
(480, 'P24MA001', 'WANLANGKUPAR SYIEMIONG', 'Male', 'p24ma001@nitm.ac.in', '7085958112', 'Mathematics', '0000-00-00', 0.00),
(481, 'S24PH014', 'Rosaleen Lyngdoh Pyngrope', 'Female', 's24ph014@nitm.ac.in', '8414019876', 'Physics', '0000-00-00', 0.00),
(482, 'P22EC004', 'KALPANA GOGOI', 'Female', 'p22ec004@nitm.ac.in', '9365272254', 'Electronics & Communication', '0000-00-00', 0.00),
(483, 'S24ph019', 'Dakerlang Wanrieh ', 'Female', 's24ph019@nitm.ac.in', '8415942719', 'Physics', '0000-00-00', 0.00),
(484, 'P24EE005', 'KRITTIKA MUKHERJEA', 'Female', 'p24ee005@nitm.ac.in', '9836228504', 'Electrical Engineering', '0000-00-00', 0.00),
(485, 'B24EE012 ', 'Banteilang Marthong ', 'Male', 'b24ee012@nitm.ac.in', '9362801336', 'Electrical Engineering', '0000-00-00', 0.00),
(486, 'P21CS004', 'Pushpak Das', 'Male', 'p21cs004@nitm.ac.in', '9538415249', 'Computer Science', '0000-00-00', 0.00),
(487, 'p24ee002', 'Dathewbhalang Tariang', 'Male', 'p24ee002@nitm.ac.in', '9774571155', 'Electrical Engineering', '0000-00-00', 0.00),
(488, 'S24MA019', 'Meshwa S Nongsiej', 'Male', 's24ma019@nitm.ac.in', '9863589839', 'Mathematics', '0000-00-00', 0.00),
(489, 'S24MA017', 'Fealty Nongrum ', 'Female', 's24ma017@nitm.ac.in', '9612574771', 'Mathematics', '0000-00-00', 0.00),
(490, 'P22EE003', 'Kingshuk Roy', 'Male', 'p22ee003@nitm.ac.in', '7044599030', 'Electrical Engineering', '0000-00-00', 0.00),
(491, 'B22EC038 ', 'Jitendra Dubey ', 'Male', 'b22ec038@nitm.ac.in', '6266184119', 'Electronics & Communication', '0000-00-00', 0.00),
(492, 'B23CE030', 'Lapynhunlang Warbah ', 'Male', 'b23ce030@nitm.ac.in', '8730996308', 'Civil Engineering', '0000-00-00', 0.00),
(493, 'B24EE018', 'KUPAR YONG O KHARDEWSAW ', 'Male', 'b24ee018@nitm.ac.in', '6033172918', 'Electrical Engineering', '0000-00-00', 0.00),
(494, 'T24EC005', 'Markdone Well Jyrwa', 'Male', 't24ec005@nitm.ac.in', '8257984574', 'Electronics & Communication', '0000-00-00', 0.00),
(495, 'S24MA012 ', 'Onkar Yuvraj Tiruke ', 'Male', 's24ma012@nitm.ac.in', '9730967453', 'Mathematics', '0000-00-00', 0.00),
(496, 'P22CE004', 'AISHI NATH', 'Female', 'p22ce004@nitm.ac.in', '9774618048', 'Civil Engineering', '0000-00-00', 0.00),
(497, 'P22EE011', 'Dip Kumar Biswas ', 'Male', 'p22ee011@nitm.ac.in', '9449416946', 'Electrical Engineering', '0000-00-00', 0.00),
(498, 'b23cs039', 'Hiyashree Sarma', 'Female', 'b23cs039@nitm.ac.in', '8638901243', 'Computer Science', '0000-00-00', 0.00),
(499, 'B23CS036 ', 'Rahul Prasad ', 'Male', 'b23cs036@nitm.ac.in', '9311449350', 'Computer Science', '0000-00-00', 0.00),
(500, 'P23MA005', 'SRIPATHI HARSHAVARDHAN SARMA', 'Male', 'p23ma005@nitm.ac.in', '8688445502', 'Mathematics', '0000-00-00', 0.00),
(501, 'p22me002', 'Mrinal Pradhan', 'Male', 'p22me002@nitm.ac.in', '8637841924', 'Mechanical Engineering', '0000-00-00', 0.00),
(502, 'B22CS013', 'Ritabrata Pal', 'Male', 'b22cs013@nitm.ac.in', '8100612595', 'Computer Science', '0000-00-00', 0.00),
(503, 'B22CS031 ', 'James Anderson Sun ', 'Male', 'b22cs031@nitm.ac.in', '9366043495', 'Computer Science', '0000-00-00', 0.00),
(504, 'b23me033', 'Anjali', 'Female', 'b23me033@nitm.ac.in', '8528743730', 'Mechanical Engineering', '0000-00-00', 0.00),
(505, 'P23EE003', 'Ngangoiba Maisnam', 'Male', 'p23ee003@nitm.ac.in', '8554038494', 'Electrical Engineering', '0000-00-00', 0.00),
(506, 'B22EC040', 'Pankaj Saraswat ', 'Male', 'b22ec040@nitm.ac.in', '9468859961', 'Electronics & Communication', '0000-00-00', 0.00),
(507, 'B23EC029 ', 'Zephyr P Canaan Rumnong ', 'Male', 'b23ec029@nitm.ac.in', '9402333991', 'Electronics & Communication', '0000-00-00', 0.00),
(508, 'B22EC013', 'Medagam Manikanta Reddy', 'Male', 'b22ec013@nitm.ac.in', '9392476335', 'Electronics & Communication', '0000-00-00', 0.00),
(509, 'S24PH011', 'Carefully Samati', 'Female', 's24ph011@nitm.ac.in', '9362763793', 'Physics', '0000-00-00', 0.00),
(510, 'p24cs012', 'Ericson Rani', 'Male', 'p24cs012@nitm.ac.in', '8414055410', 'Computer Science', '0000-00-00', 0.00),
(511, 'P24CS008', 'Mhasivillie sekhose', 'Male', 'p24cs008@nitm.ac.in', '8416027068', 'Computer Science', '0000-00-00', 0.00),
(512, 'S24MA007', 'Prince Bharti ', 'Male', 's24ma007@nitm.ac.in', '9693784312', 'Mathematics', '0000-00-00', 0.00),
(513, 'P24EC012', 'Arunava Maiti', 'Male', 'p24ec012@nitm.ac.in', '8250060810', 'Electronics & Communication', '0000-00-00', 0.00),
(514, 'S24MA004', 'Mriganka Rajkhowa ', 'Male', 's24ma004@nitm.ac.in', '6001551823', 'Mathematics', '0000-00-00', 0.00),
(515, 'P24CE002', 'Aditya Tarafdar', 'Male', 'p24ce002@nitm.ac.in', '6009422242', 'Civil Engineering', '0000-00-00', 0.00),
(516, 'B24EE019', 'Ankana Modak ', 'Female', 'b24ee019@nitm.ac.in', '8240528689', 'Electrical Engineering', '0000-00-00', 0.00),
(517, 'p24ec001', 'Geetima Kachari', 'Female', 'p24ec001@nitm.ac.in', '9436945671', 'Electronics & Communication', '0000-00-00', 0.00),
(518, 'b23ec033 ', 'Wankmenlang Mylliemngap ', 'Male', 'b23ec033@nitm.ac.in', '9863342993', 'Electronics & Communication', '0000-00-00', 0.00),
(519, 'T24EE008 ', 'Samdy Mylliem ', 'Male', 't24ee008@nitm.ac.in', '9366883896', 'Electrical Engineering', '0000-00-00', 0.00),
(520, 'B22ME001', 'Mushfique Ahmed ', 'Male', 'b22me001@nitm.ac.in', '6033390295', 'Mechanical Engineering', '0000-00-00', 0.00),
(521, 'B23EE029', 'Bhabok Myrchiang', 'Male', 'b23ee029@nitm.ac.in', '9362756221', 'Electrical Engineering', '0000-00-00', 0.00),
(522, 'B23EC032', 'Paitlangmiki Dkhar ', 'Male', 'b23ec032@nitm.ac.in', '6909662040', 'Electronics & Communication', '0000-00-00', 0.00),
(523, 'P22CY006', 'Basudha Deb ', 'Female', 'p22cy006@nitm.ac.in', '8473043722', 'Chemistry', '0000-00-00', 0.00),
(524, 'B22EC017', 'Angelo Tengsuan G Momin ', 'Male', 'b22ec017@nitm.ac.in', '8974801071', 'Electronics & Communication', '0000-00-00', 0.00),
(525, 'B23EE022', 'MEDIBOINA SATYANAND ', 'Male', 'b23ee022@nitm.ac.in', '6281616377', 'Electrical Engineering', '0000-00-00', 0.00),
(526, 'B23CS016', 'Komal chaudhari ', 'Female', 'b23cs016@nitm.ac.in', '8887950968', 'Computer Science', '0000-00-00', 0.00),
(527, 'B23EC024 ', 'Doni koch', 'Male', 'b23ec024@nitm.ac.in', '9366499942', 'Electronics & Communication', '0000-00-00', 0.00),
(528, 'B22EC028', 'Islavath Anil kumar', 'Male', 'b22ec028@nitm.ac.in', '9381317438', 'Electronics & Communication', '0000-00-00', 0.00),
(529, 'T24ec004', 'Shyam Kumar ', 'Male', 't24ec004@nitm.ac.in', '8227890135', 'Electronics & Communication', '0000-00-00', 0.00),
(530, 'P22ME017', 'Krittika Patwari', 'Female', 'p22me017@nitm.ac.in', '8723969649', 'Mechanical Engineering', '0000-00-00', 0.00),
(531, 'P24MA002', 'HIMANGSHU BARMAN', 'Male', 'p24ma002@nitm.ac.in', '6000365829', 'Mathematics', '0000-00-00', 0.00),
(532, 'P24CE003', 'AMERIOCA THANGKHIEW', 'Female', 'p24ce003@nitm.ac.in', '9366897586', 'Civil Engineering', '0000-00-00', 0.00),
(533, 'B22CE022', 'Nakadabet Ymbon', 'Female', 'b22ce022@nitm.ac.in', '6033164731', 'Civil Engineering', '0000-00-00', 0.00),
(534, 'P24CS004', 'AYUSH SHUKLA', 'Male', 'p24cs004@nitm.ac.in', '9696154815', 'Computer Science', '0000-00-00', 0.00),
(535, 'B23CE022', 'Freddy Kharkylliang ', 'Male', 'b23ce022@nitm.ac.in', '9863974291', 'Civil Engineering', '0000-00-00', 0.00),
(536, 'B23ME015', 'Gauri Rani ', 'Female', 'b23me015@nitm.ac.in', '8678850676', 'Mechanical Engineering', '0000-00-00', 0.00),
(537, 'P23CY006', 'Rimpi Gogoi', 'Female', 'p23cy006@nitm.ac.in', '8135912101', 'Chemistry', '0000-00-00', 0.00),
(538, 'B22EC035', 'Rohan Sangma', 'Male', 'b22ec035@nitm.ac.in', '7005231190', 'Electronics & Communication', '0000-00-00', 0.00),
(539, 'B22CS023 ', 'Binjraj Singh ', 'Male', 'b22cs023@nitm.ac.in', '9672340861', 'Computer Science', '0000-00-00', 0.00),
(540, 'p24ph002', 'Garryson Dkhar', 'Male', 'p24ph002@nitm.ac.in', '8837272360', 'Physics', '0000-00-00', 0.00),
(541, 'B23EE016', 'J Kishan Kanth', 'Male', 'b23ee016@nitm.ac.in', '7358061751', 'Electrical Engineering', '0000-00-00', 0.00),
(542, 'b23me020', 'Akshaj sunil ', 'Male', 'b23me020@nitm.ac.in', '9188835188', 'Mechanical Engineering', '0000-00-00', 0.00),
(543, 'P24MA003', 'Mehjebin Wahid ', 'Female', 'p24ma003@nitm.ac.in', '9395015088', 'Mathematics', '0000-00-00', 0.00),
(544, 'B24CE022', 'Kavinna K S ', 'Female', 'b24ce022@nitm.ac.in', '8015668062', 'Civil Engineering', '0000-00-00', 0.00),
(545, 'P34cs009', 'Mughalu', 'Male', 'p24cs009@nitm.ac.in', '8413938111', 'Computer Science', '0000-00-00', 0.00),
(546, 'B23CS031', 'Brian Lim Sun', 'Male', 'b23cs031@nitm.ac.in', '9362041489', 'Computer Science', '0000-00-00', 0.00),
(547, 'B23EE007', 'Abhishek Paul', 'Male', 'b23ee007@nitm.ac.in', '8794435020', 'Electrical Engineering', '0000-00-00', 0.00),
(548, 'B24CS002', 'Aadesh Upadhaya ', 'Male', 'b24cs002@nitm.ac.in', '7005409678', 'Computer Science', '0000-00-00', 0.00),
(549, 'P21EC001', 'Shyamosree Goswami', 'Female', 'p21ec001@nitm.ac.in', '8638304239', 'Electronics & Communication', '0000-00-00', 0.00),
(550, 'S24PH015', 'Mismita Datta ', 'Female', 's24ph015@nitm.ac.in', '8119998577', 'Physics', '0000-00-00', 0.00),
(551, 'P24CE006', 'PAPORI DAS', 'Female', 'p24ce006@nitm.ac.in', '7002692436', 'Civil Engineering', '0000-00-00', 0.00),
(552, 'p22ec003', 'Dolly kumari', 'Female', 'p22ec003@nitm.ac.in', '9582355847', 'Electronics & Communication', '0000-00-00', 0.00),
(553, 'B22EC009', 'Ashirbad Raj Arya', 'Male', 'b22ec009@nitm.ac.in', '9485394026', 'Electronics & Communication', '0000-00-00', 0.00),
(554, 'B23CS006', 'Ribait Phawa ', 'Male', 'b23cs006@nitm.ac.in', '6909027811', 'Computer Science', '0000-00-00', 0.00),
(555, 'T24ME006 ', 'Raktim Jyoti Nath', 'Male', 't24me006@nitm.ac.in', '8721960598', 'Mechanical Engineering', '0000-00-00', 0.00),
(556, 'P24CE011 ', 'PRAGYAN PRIYADARSHINI ', 'Female', 'p24ce011@nitm.ac.in', '7978569162', 'Civil Engineering', '0000-00-00', 0.00),
(557, 'B24ME008', 'Ejeip Mawlong ', 'Male', 'b24me008@nitm.ac.in', '9774424736', 'Mechanical Engineering', '0000-00-00', 0.00),
(558, 'P24CS010', 'Subhrajeet Ganguly', 'Male', 'p24cs010@nitm.ac.in', '8697815361', 'Computer Science', '0000-00-00', 0.00),
(559, 'B24CE025', 'GAININGSTAR PIO KHARNONGKHLAW ', 'Male', 'b24ce025@nitm.ac.in', '8974423509', 'Civil Engineering', '0000-00-00', 0.00),
(560, 'P24CE005', 'Nameirakpam Bimolchandra Meitei ', 'Male', 'p24ce005@nitm.ac.in', '8731862162', 'Civil Engineering', '0000-00-00', 0.00),
(561, 'B24CS022', 'Alfred Hriiziio Chachei', 'Male', 'b24cs022@nitm.ac.in', '8257805386', 'Computer Science', '0000-00-00', 0.00),
(562, 'b23ce010', 'Govindam kumar ', 'Male', 'b23ce010@nitm.ac.in', '9801627936', 'Civil Engineering', '0000-00-00', 0.00),
(563, 'B24me004', 'Poulomi Das', 'Female', 'b24me004@nitm.ac.in', '9366819439', 'Mechanical Engineering', '0000-00-00', 0.00),
(564, 'S24CB016', 'Hakaru Dkhar ', 'Female', 's24cb016@nitm.ac.in', '9612085347', 'Chemical Engineering', '0000-00-00', 0.00),
(565, 'S24CBO20 ', 'Ruthi Halam ', 'Female', 's24cb020@nitm.ac.in', '9864755015', 'Chemical Engineering', '0000-00-00', 0.00),
(566, 'B24ME019', 'Abhishek Gupta', 'Male', 'b24me019@nitm.ac.in', '8539065207', 'Mechanical Engineering', '0000-00-00', 0.00),
(567, 'B15EC018 ', 'Shiihrani ', 'Female', 'b15ec018@nitm.ac.in', '9615060527', 'Electronics & Communication', '0000-00-00', 0.00),
(568, 'B22CE011', 'Subhajit Khan', 'Male', 'b22ce011@nitm.ac.in', '6296792638', 'Civil Engineering', '0000-00-00', 0.00),
(569, 'B22CS012 ', 'Avinash Kumar Singh ', 'Male', 'b22cs012@nitm.ac.in', '9693643724', 'Computer Science', '0000-00-00', 0.00),
(570, 'B24CS035', 'SHAIK THANVEER ', 'Male', 'b24cs035@nitm.ac.in', '8309764404', 'Computer Science', '0000-00-00', 0.00),
(571, 'P23ME002', 'Jyoti Moni Devi', 'Female', 'p23me002@nitm.ac.in', '9365113365', 'Mechanical Engineering', '0000-00-00', 0.00),
(572, 'p21ph001', 'Shibsankar Si', 'Male', 'p21ph001@nitm.ac.in', '8001755803', 'Physics', '0000-00-00', 0.00),
(573, 'P21CE004', 'Donkupar Francis Marbaniang', 'Male', 'p21ce004@nitm.ac.in', '8797042367', 'Civil Engineering', '0000-00-00', 0.00),
(574, 'T24CE001', 'Pynbhalang Kupar Warlarpih', 'Male', 't24ce001@nitm.ac.in', '7005266465', 'Civil Engineering', '0000-00-00', 0.00),
(575, 'T24CE009', 'Datamlin kma', 'Male', 't24ce009@nitm.ac.in', '8258958305', 'Civil Engineering', '0000-00-00', 0.00),
(576, 'B23EC021 ', 'Shanbok Ramshon ', 'Male', 'b23ec021@nitm.ac.in', '7641903119', 'Electronics & Communication', '0000-00-00', 0.00),
(577, 'B22EEO28 ', 'Shubham Kumar ', 'Male', 'b22ee028@nitm.ac.in', '6201781181', 'Electrical Engineering', '0000-00-00', 0.00),
(578, 'B23CS028', 'Anish jhajharia ', 'Male', 'b23cs028@nitm.ac.in', '9257424849', 'Computer Science', '0000-00-00', 0.00),
(579, 'p24me007', 'Rishanbor Syiemlieh', 'Male', 'p24me007@nitm.ac.in', '8575897370', 'Mechanical Engineering', '0000-00-00', 0.00),
(580, 'p24ce010', 'Yeshpal ', 'Male', 'p24ce010@nitm.ac.in', '8210313157', 'Civil Engineering', '0000-00-00', 0.00),
(581, 'B24CE005', 'Donclinbath M Sangma', 'Male', 'b24ce005@nitm.ac.in', '7005368806', 'Civil Engineering', '0000-00-00', 0.00),
(582, 'B22EC010', 'Aerio Jobin G Momin', 'Male', 'b22ec010@nitm.ac.in', '8414074701', 'Electronics & Communication', '0000-00-00', 0.00),
(583, 'S24PH020', 'GAURAV RAJ', 'Male', 's24ph020@nitm.ac.in', '8102721237', 'Physics', '0000-00-00', 0.00),
(584, 'S24ph007 ', 'Ananya Mondal ', 'Female', 's24ph007@nitm.ac.in', '7477682038', 'Physics', '0000-00-00', 0.00),
(585, 'B23cs003', 'Kavindu dilshan amarasingha', 'Male', 'b23cs003@nitm.ac.in', '9366959269', 'Computer Science', '0000-00-00', 0.00),
(586, 'B25EE021', 'Aryan Kumar Singh ', 'Male', 'b25ee021@nitm.ac.in', '9508505985', 'Electrical Engineering', '0000-00-00', 0.00),
(587, 'B25CS008', 'Aakash Choudhury ', 'Male', 'b25cs008@nitm.ac.in', '7005729346', 'Computer Science', '0000-00-00', 0.00),
(588, 'B25ME006', 'Amanda B Sangma', 'Female', 'b25me006@nitm.ac.in', '6009645234', 'Mechanical Engineering', '0000-00-00', 0.00),
(589, 'B25CS025 ', 'Aryan Sharma', 'Male', 'b25cs025@nitm.ac.in', '9555237200', 'Computer Science', '0000-00-00', 0.00),
(590, 'b25cs026', 'Durgesh yadav', 'Male', 'b25cs026@nitm.ac.in', '8881417060', 'Computer Science', '0000-00-00', 0.00),
(591, 'B25EC017', 'Harsh Kumar', 'Male', 'b25ec017@nitm.ac.in', '8235249909', 'Electronics & Communication', '0000-00-00', 0.00),
(592, 'B25CS001', 'Nabin Kumar Chaudhary', 'Male', 'b25cs001@nitm.ac.in', '6364826626', 'Computer Science', '0000-00-00', 0.00),
(593, 'b25me017', 'Ajmain Nihal Rahi ', 'Male', 'b25me017@nitm.ac.in', '7908547971', 'Mechanical Engineering', '0000-00-00', 0.00),
(594, 'B25EE029', 'Aman kumar ', 'Male', 'b25ee029@nitm.ac.in', '9234031713', 'Electrical Engineering', '0000-00-00', 0.00),
(595, 'B25CE012', 'HUN I HIMONMI RYNGKHLEM ', 'Female', 'b25ce012@nitm.ac.in', '9362232137', 'Civil Engineering', '0000-00-00', 0.00),
(596, 'B25EC033 ', 'Koyyalamudi praveena Venkatesh ', 'Male', 'b25ec033@nitm.ac.in', '7330727487', 'Electronics & Communication', '0000-00-00', 0.00),
(597, 'B25EC023', 'ADITYA SAHA', 'Male', 'b25ec023@nitm.ac.in', '8910616186', 'Electronics & Communication', '0000-00-00', 0.00),
(598, 'B25EE023', 'Aaryansha Tanvi', 'Female', 'b25ee023@nitm.ac.in', '9263215656', 'Electrical Engineering', '0000-00-00', 0.00),
(599, 'B25EE010 ', 'JEBAN BIAM ', 'Male', 'b25ee010@nitm.ac.in', '9362834570', 'Electrical Engineering', '0000-00-00', 0.00),
(600, 'B25EC004 ', 'Annie Angel Pakem ', 'Female', 'b25ec004@nitm.ac.in', '9383296497', 'Electronics & Communication', '0000-00-00', 0.00),
(601, 'B25EE018', 'Neel Jarwal ', 'Male', 'b25ee018@nitm.ac.in', '8529251515', 'Electrical Engineering', '0000-00-00', 0.00),
(602, 'B25EC009 ', 'Habakup Lyngdoh Nonglait ', 'Male', 'b25ec009@nitm.ac.in', '9612295938', 'Electronics & Communication', '0000-00-00', 0.00),
(603, 'B25CS002', 'Salil Kundu ', 'Male', 'b25cs002@nitm.ac.in', '8413849414', 'Computer Science', '0000-00-00', 0.00),
(604, 'B25CS006', 'Raulkith Wanniang', 'Male', 'b25cs006@nitm.ac.in', '7629016371', 'Computer Science', '0000-00-00', 0.00),
(605, 'B25EE001', 'Audreet sen gupta', 'Male', 'b25ee001@nitm.ac.in', '6289196528', 'Electrical Engineering', '0000-00-00', 0.00),
(606, 'B25EC021', 'ANIKET SINGH', 'Male', 'b25ec021@nitm.ac.in', '9792001671', 'Electronics & Communication', '0000-00-00', 0.00),
(607, 'B25EC007 ', 'DIBYA SUNDAR BANERJEE ', 'Male', 'b25ec007@nitm.ac.in', '8787555399', 'Electronics & Communication', '0000-00-00', 0.00),
(608, 'B25EE008', 'Mandesal M Sangma', 'Male', 'b25ee008@nitm.ac.in', '6009945906', 'Electrical Engineering', '0000-00-00', 0.00),
(609, 'B25CS012', 'Kabean Tangba D Shira ', 'Male', 'b25cs012@nitm.ac.in', '8798890103', 'Computer Science', '0000-00-00', 0.00),
(610, 'B25EE013', 'Manish chauhan', 'Male', 'b25ee013@nitm.ac.in', '6397303738', 'Electrical Engineering', '0000-00-00', 0.00),
(611, 'B25EE007 ', 'Ibadahunshisha Nongdhar ', 'Female', 'b25ee007@nitm.ac.in', '8837364585', 'Electrical Engineering', '0000-00-00', 0.00),
(612, 'B25EC019', 'Shngainkupar Nongdkhar ', 'Male', 'b25ec019@nitm.ac.in', '6009980158', 'Electronics & Communication', '0000-00-00', 0.00),
(613, 'B25EE005', 'Baphilari Thabah ', 'Female', 'b25ee005@nitm.ac.in', '6909065053', 'Electrical Engineering', '0000-00-00', 0.00),
(614, 'B25EC032 ', 'ARCHI KUMARI ', 'Female', 'b25ec032@nitm.ac.in', '9229670117', 'Electronics & Communication', '0000-00-00', 0.00),
(615, 'B25ec034', 'Deepak yadav', 'Male', 'b25ec034@nitm.ac.in', '8707232043', 'Electronics & Communication', '0000-00-00', 0.00),
(616, 'B25ce020 ', 'Satyanshi Raj ', 'Female', 'b25ce020@nitm.ac.in', '7004178843', 'Civil Engineering', '0000-00-00', 0.00),
(617, 'B25EE004 ', 'Nangbha Shaphrang Marbaniang', 'Male', 'b25ee004@nitm.ac.in', '8259905929', 'Electrical Engineering', '0000-00-00', 0.00),
(618, 'C25CS001', 'Anmol Saini', 'Male', 'c25cs001@nitm.ac.in', '9588450286', 'Computer Science', '0000-00-00', 0.00),
(619, 'B25EE020 ', 'Komal Kumari ', 'Female', 'b25ee020@nitm.ac.in', '7763092816', 'Electrical Engineering', '0000-00-00', 0.00),
(620, 'B25me016', 'Markandeya Raj Srivastava ', 'Male', 'b25me016@nitm.ac.in', '6392659157', 'Mechanical Engineering', '0000-00-00', 0.00),
(621, 'b25ec031', 'KONDURI SAITEJA', 'Male', 'b25ec031@nitm.ac.in', '9392560343', 'Electronics & Communication', '0000-00-00', 0.00),
(622, 'B25EE024', 'Mayank Chaubey ', 'Male', 'b25ee024@nitm.ac.in', '9142407363', 'Electrical Engineering', '0000-00-00', 0.00),
(623, 'B25EE028', 'Aditya Singh', 'Male', 'b25ee028@nitm.ac.in', '6307324981', 'Electrical Engineering', '0000-00-00', 0.00),
(624, 'Be25ce027', 'Arnit kumar ', 'Male', 'b25ce027@nitm.ac.in', '7295908510', 'Civil Engineering', '0000-00-00', 0.00),
(625, 'B25ME001', 'Banpyntip Rumnong ', 'Male', 'b25me001@nitm.ac.in', '9366510056', 'Mechanical Engineering', '0000-00-00', 0.00),
(626, 'B25EC016 ', 'Anisha Jyrwa ', 'Female', 'b25ec016@nitm.ac.in', '8131829080', 'Electronics & Communication', '0000-00-00', 0.00),
(627, 'B25ME008 ', 'XIAKO SOHORCHUI HORAM ', 'Male', 'b25me008@nitm.ac.in', '9362807767', 'Mechanical Engineering', '0000-00-00', 0.00),
(628, 'B25CE008', 'Ratna Kanta Rabha ', 'Male', 'b25ce008@nitm.ac.in', '8974236612', 'Civil Engineering', '0000-00-00', 0.00),
(629, 'B25EE025', 'Harsh Bardhan Kumar', 'Male', 'b25ee025@nitm.ac.in', '8798932611', 'Electrical Engineering', '0000-00-00', 0.00),
(630, 'B25CE007', 'Mebankerlang Syiemlieh ', 'Male', 'b25ce007@nitm.ac.in', '7085303594', 'Civil Engineering', '0000-00-00', 0.00),
(631, 'b25ee030', 'Vishal Kumar ', 'Male', 'b25ee030@nitm.ac.in', '9835616605', 'Electrical Engineering', '0000-00-00', 0.00),
(632, 'B25CS011 ', 'JEFFERSON NONGRUM ', 'Male', 'b25cs011@nitm.ac.in', '7629044503', 'Computer Science', '0000-00-00', 0.00),
(633, 'B25CE022', 'Ananya Singh ', 'Female', 'b25ce022@nitm.ac.in', '8507785946', 'Civil Engineering', '0000-00-00', 0.00),
(634, 'B25ME007', 'Chugado S Marak', 'Male', 'b25me007@nitm.ac.in', '9366720579', 'Mechanical Engineering', '0000-00-00', 0.00),
(635, 'B25EC022', 'Vishnu Kant Rai ', 'Male', 'b25ec022@nitm.ac.in', '8168596185', 'Electronics & Communication', '0000-00-00', 0.00),
(636, 'B25EC011', 'MYRON TOBIAS SHABONG ', 'Male', 'b25ec011@nitm.ac.in', '8014821993', 'Electronics & Communication', '0000-00-00', 0.00),
(637, 'B25CS021', 'Tushar Jaiswal ', 'Male', 'b25cs021@nitm.ac.in', '9874291381', 'Computer Science', '0000-00-00', 0.00),
(638, 'B25EE027', 'Aadarsh Yadav', 'Male', 'b25ee027@nitm.ac.in', '9520389958', 'Electrical Engineering', '0000-00-00', 0.00),
(639, 'B25ME009', 'Gedeon Lamin ', 'Male', 'b25me009@nitm.ac.in', '6909862704', 'Mechanical Engineering', '0000-00-00', 0.00),
(640, 'B25EE017 ', 'Shimborlang Kharsyiemlieh', 'Male', 'b25ee017@nitm.ac.in', '8730999594', 'Electrical Engineering', '0000-00-00', 0.00),
(641, 'B25EE016', 'FULLBEST PARIONG ', 'Male', 'b25ee016@nitm.ac.in', '9362307068', 'Electrical Engineering', '0000-00-00', 0.00),
(642, 'B25EC006 ', 'K Deepasha ', 'Female', 'b25ec006@nitm.ac.in', '9749979083', 'Electronics & Communication', '0000-00-00', 0.00),
(643, 'B25EE011', 'MADHURIMA DEORI ', 'Female', 'b25ee011@nitm.ac.in', '9707504446', 'Electrical Engineering', '0000-00-00', 0.00),
(644, 'B25CS016', 'TEIBORLANG MARBANIANG ', 'Male', 'b25cs016@nitm.ac.in', '9233802018', 'Computer Science', '0000-00-00', 0.00),
(645, 'B25CS013', 'Sambao N Marak', 'Male', 'b25cs013@nitm.ac.in', '9233144483', 'Computer Science', '0000-00-00', 0.00),
(646, 'B25CE023', 'Aman Kumar ', 'Male', 'b25ce023@nitm.ac.in', '7858088852', 'Civil Engineering', '0000-00-00', 0.00),
(647, 'B25ME010', 'Sayantan Roy ', 'Male', 'b25me010@nitm.ac.in', '9402177348', 'Mechanical Engineering', '0000-00-00', 0.00),
(648, 'B25ME004', 'Sa Me Kyrpang Khonglah', 'Male', 'b25me004@nitm.ac.in', '9466814988', 'Mechanical Engineering', '0000-00-00', 0.00),
(649, 'B25me011', 'Kunal Kushwah ', 'Male', 'b25me011@nitm.ac.in', '9343130297', 'Mechanical Engineering', '0000-00-00', 0.00),
(650, 'B25CE021', 'Ritesh Raj', 'Male', 'b25ce021@nitm.ac.in', '8969904705', 'Civil Engineering', '0000-00-00', 0.00),
(651, 'B25EE002', 'Jyotipriya Bhattacharjee ', 'Female', 'b25ee002@nitm.ac.in', '6374547290', 'Electrical Engineering', '0000-00-00', 0.00),
(652, 'B25CE006', 'Dawanka J Lamare ', 'Female', 'b25ce006@nitm.ac.in', '9366878830', 'Civil Engineering', '0000-00-00', 0.00),
(653, 'B25EE019', 'Naman kumar Abhinav ', 'Male', 'b25ee019@nitm.ac.in', '8674989002', 'Electrical Engineering', '0000-00-00', 0.00),
(654, 'T24CS014', 'MARVI CHADAP', 'Male', 't24cs014@nitm.ac.in', '8787623900', 'Computer Science', '0000-00-00', 0.00),
(655, 'B25CE004', 'Joycymary Nongspung ', 'Female', 'b25ce004@nitm.ac.in', '8798935530', 'Civil Engineering', '0000-00-00', 0.00),
(656, 'B25CE002', 'LALTHLANGAMA DARNEI', 'Male', 'b25ce002@nitm.ac.in', '9873420727', 'Civil Engineering', '0000-00-00', 0.00),
(657, 'B25CS027', 'RAMAVATH RAKESH ', 'Male', 'b25cs027@nitm.ac.in', '9989431349', 'Computer Science', '0000-00-00', 0.00),
(658, 'B25CE025', 'Deepender', 'Male', 'b25ce025@nitm.ac.in', '9729124863', 'Civil Engineering', '0000-00-00', 0.00),
(659, 'B25CE003', 'Renew Surong ', 'Female', 'b25ce003@nitm.ac.in', '9863206569', 'Civil Engineering', '0000-00-00', 0.00),
(660, 'B25CE010', 'Bantyngshain Kalwing ', 'Male', 'b25ce010@nitm.ac.in', '9863641463', 'Civil Engineering', '0000-00-00', 0.00),
(661, 'B25CE009', 'HAMEBANKYNTIEW LALOO', 'Male', 'b25ce009@nitm.ac.in', '6033092271', 'Civil Engineering', '0000-00-00', 0.00),
(662, 'B25ME005', 'MEWAEBORI NONGTDEH ', 'Male', 'b25me005@nitm.ac.in', '7630037166', 'Mechanical Engineering', '0000-00-00', 0.00),
(663, 'B25ME003 ', 'ROONEY KHARCHANDY ', 'Male', 'b25me003@nitm.ac.in', '9774325502', 'Mechanical Engineering', '0000-00-00', 0.00),
(664, 'B25CE005', 'LIBARI RANI ', 'Female', 'b25ce005@nitm.ac.in', '8787325734', 'Civil Engineering', '0000-00-00', 0.00),
(665, 'B25EC014', 'Ruhul Amin', 'Male', 'b25ec014@nitm.ac.in', '7635835182', 'Electronics & Communication', '0000-00-00', 0.00),
(666, 'B25EC005', 'Amartya Chakraborty', 'Male', 'b25ec005@nitm.ac.in', '9123655245', 'Electronics & Communication', '0000-00-00', 0.00),
(667, 'B25CE013', 'STUTI SINHA', 'Female', 'b25ce013@nitm.ac.in', '9123491302', 'Civil Engineering', '0000-00-00', 0.00),
(668, 'B25m2022', 'Kunal pancholi', 'Male', 'b25me022@nitm.ac.in', '7070601443', 'General', '0000-00-00', 0.00),
(669, 'B25ME013', 'Somil Chaturvedi ', 'Male', 'b25me013@nitm.ac.in', '7050921383', 'Mechanical Engineering', '0000-00-00', 0.00),
(670, 'B25EE012', 'Emsame Shallam ', 'Male', 'b25ee012@nitm.ac.in', '6033097225', 'Electrical Engineering', '0000-00-00', 0.00),
(671, 'B25EC003', 'Braios Kyndait ', 'Male', 'b25ec003@nitm.ac.in', '7005876135', 'Electronics & Communication', '0000-00-00', 0.00),
(672, 'B25EE003 ', 'HEIRTA MI PYRTUH ', 'Male', 'b25ee003@nitm.ac.in', '9862830285', 'Electrical Engineering', '0000-00-00', 0.00),
(673, 'B25CS031', 'Yash Kumar Yadav', 'Male', 'b25cs031@nitm.ac.in', '8269922628', 'Computer Science', '0000-00-00', 0.00),
(674, 'B23EC042', 'Aryan raj', 'Male', 'b23ec042@nitm.ac.in', '7050553723', 'Electronics & Communication', '0000-00-00', 0.00),
(675, 'B25ME029', 'Mandeep Kumar ', 'Male', 'b25me029@nitm.ac.in', '6386770206', 'Mechanical Engineering', '0000-00-00', 0.00),
(676, 'B25EC001', 'Protik Biswas', 'Male', 'b25ec001@nitm.ac.in', '9038853972', 'Electronics & Communication', '0000-00-00', 0.00),
(677, 'B25CS014', 'Daskhemhun Nongkynrih ', 'Male', 'b25cs014@nitm.ac.in', '7630003477', 'Computer Science', '0000-00-00', 0.00),
(678, 'B25CE011', 'Joshua Kasangku M Sangma', 'Male', 'b25ce011@nitm.ac.in', '9383336155', 'Civil Engineering', '0000-00-00', 0.00),
(679, 'B25ME026', 'Pamarthi Anand Kumar ', 'Male', 'b25me026@nitm.ac.in', '9573366244', 'Mechanical Engineering', '0000-00-00', 0.00),
(680, 'B25ME024', 'Neha Nirmal ', 'Female', 'b25me024@nitm.ac.in', '9214806373', 'Mechanical Engineering', '0000-00-00', 0.00),
(681, 'B25CS017', 'Arush saxena', 'Male', 'b25cs017@nitm.ac.in', '9555795201', 'Computer Science', '0000-00-00', 0.00),
(682, 'B25CE001', 'HARISH RIKSRANG A MARAK', 'Male', 'b25ce001@nitm.ac.in', '7005032970', 'Civil Engineering', '0000-00-00', 0.00),
(683, 'B25CS030', 'Ngarakzak Jagoi', 'Male', 'b25cs030@nitm.ac.in', '6009319976', 'Computer Science', '0000-00-00', 0.00),
(684, 'B25EE022', 'Ritesh Kumar ', 'Male', 'b25ee022@nitm.ac.in', '8114507523', 'Electrical Engineering', '0000-00-00', 0.00),
(685, 'B25EC002', 'Aparajita Das ', 'Female', 'b25ec002@nitm.ac.in', '7063219669', 'Electronics & Communication', '0000-00-00', 0.00),
(686, 'b25cs018', 'Arpit kumar', 'Male', 'b25cs018@nitm.ac.in', '6207826465', 'Computer Science', '0000-00-00', 0.00),
(687, 'B25EC013', 'Khraw Kupar Wahlang ', 'Male', 'b25ec013@nitm.ac.in', '9862673544', 'Electronics & Communication', '0000-00-00', 0.00),
(688, 'B25EC010', 'Bankitkupar Chyne', 'Male', 'b25ec010@nitm.ac.in', '7005923108', 'Electronics & Communication', '0000-00-00', 0.00),
(689, 'B25ME019', 'Shivika singh', 'Female', 'b25me019@nitm.ac.in', '6290310539', 'Mechanical Engineering', '0000-00-00', 0.00),
(690, 'b25cs019', 'Avinash Kumar ', 'Male', 'b25cs019@nitm.ac.in', '9262665527', 'Computer Science', '0000-00-00', 0.00),
(691, 'B25EC024', 'Kalukuntla Ram Charan Reddy ', 'Male', 'b25ec024@nitm.ac.in', '6302105741', 'Electronics & Communication', '0000-00-00', 0.00),
(692, 'b25cs029', 'Md shiban ahmed', 'Male', 'b25cs029@nitm.ac.in', '9701696063', 'Computer Science', '0000-00-00', 0.00),
(693, 'B25EC026', 'Sonal Kumari ', 'Female', 'b25ec026@nitm.ac.in', '9341953851', 'Electronics & Communication', '0000-00-00', 0.00),
(694, 'B25CE028 ', 'Abhishek Kumar ', 'Male', 'b25ce028@nitm.ac.in', '7091651281', 'Civil Engineering', '0000-00-00', 0.00),
(695, 'B25CS028 ', 'KRISHNO DAS', 'Male', 'b25cs028@nitm.ac.in', '9233191574', 'Computer Science', '0000-00-00', 0.00),
(696, 'B25EC018', 'Bankotbor Pariong ', 'Male', 'b25ec018@nitm.ac.in', '9863283254', 'Electronics & Communication', '0000-00-00', 0.00),
(697, 'B25ME015', 'Jeet Das', 'Male', 'b25me015@nitm.ac.in', '7903804704', 'Mechanical Engineering', '0000-00-00', 0.00),
(698, 'B25ME023', 'Ankit Kumar', 'Male', 'b25me023@nitm.ac.in', '9123110724', 'Mechanical Engineering', '0000-00-00', 0.00),
(699, 'B25ME018 ', 'ROBIN XAVIER ', 'Male', 'b25me018@nitm.ac.in', '8105781040', 'Mechanical Engineering', '0000-00-00', 0.00),
(700, 'b25ee026', 'RIKKALA KARTHIK REDDY ', 'Male', 'b25ee026@nitm.ac.in', '7337394558', 'Electrical Engineering', '0000-00-00', 0.00),
(701, 'B25CS003', 'Tegrik Marak', 'Male', 'b25cs003@nitm.ac.in', '8794862161', 'Computer Science', '0000-00-00', 0.00),
(702, 'B25EC029', 'Deeksha Rathore', 'Female', 'b25ec029@nitm.ac.in', '9002472015', 'Electronics & Communication', '0000-00-00', 0.00),
(703, 'B25CS024', 'Nitin Tiwari ', 'Male', 'b25cs024@nitm.ac.in', '9354152854', 'Computer Science', '0000-00-00', 0.00),
(704, 'B25EE014', 'Veyelu Phesao ', 'Female', 'b25ee014@nitm.ac.in', '6009960118', 'Electrical Engineering', '0000-00-00', 0.00),
(705, 'B25EC012', 'Manani Jeet Sureshbhai ', 'Male', 'b25ec012@nitm.ac.in', '9313756399', 'Electronics & Communication', '0000-00-00', 0.00),
(706, 'B25CE018', 'Kuldeep kumar ', 'Male', 'b25ce018@nitm.ac.in', '9251282121', 'Civil Engineering', '0000-00-00', 0.00),
(707, 'B25CS023', 'Insha bano', 'Female', 'b25cs023@nitm.ac.in', '6269670045', 'Computer Science', '0000-00-00', 0.00),
(708, 'B25CS005', 'MACDONALD LYNGDOH', 'Male', 'b25cs005@nitm.ac.in', '6033509510', 'Computer Science', '0000-00-00', 0.00),
(709, 'B25CEO19 ', 'Debjit Dey ', 'Male', 'b25ce019@nitm.ac.in', '9477474662', 'Civil Engineering', '0000-00-00', 0.00),
(710, 'B25CS009', 'Abhinav gupta ', 'Male', 'b25cs009@nitm.ac.in', '7494954303', 'Computer Science', '0000-00-00', 0.00),
(711, 'b25cs004', 'Shweta Sarna', 'Female', 'b25cs004@nitm.ac.in', '9485358432', 'Computer Science', '0000-00-00', 0.00),
(712, 'B25CS010', 'Kishlay Vishlux', 'Male', 'b25cs010@nitm.ac.in', '9774366830', 'Computer Science', '0000-00-00', 0.00),
(713, 'B25ME028', 'Krish Sandip Patil ', 'Male', 'b25me028@nitm.ac.in', '7498890462', 'Mechanical Engineering', '0000-00-00', 0.00),
(714, 'B25CE024', 'Pragya Sinha ', 'Female', 'b25ce024@nitm.ac.in', '8340458395', 'Civil Engineering', '0000-00-00', 0.00),
(715, 'B25me027', 'Kethavath himabindhu ', 'Female', 'b25me027@nitm.ac.in', '9390621326', 'Mechanical Engineering', '0000-00-00', 0.00),
(716, 'B25CS007 ', 'Derime Arengh', 'Female', 'b25cs007@nitm.ac.in', '9863889305', 'Computer Science', '0000-00-00', 0.00),
(717, 'B25EC027', 'PRAGADHESSWARAN MS', 'Male', 'b25ec027@nitm.ac.in', '9944128678', 'Electronics & Communication', '0000-00-00', 0.00),
(718, 'B25ce015 ', 'Bawanpynskhem Myrthong ', 'Male', 'b25ce015@nitm.ac.in', '9863024153', 'Civil Engineering', '0000-00-00', 0.00),
(719, 'B25EC015 ', 'Risakmen KharWanniang ', 'Female', 'b25ec015@nitm.ac.in', '9233856854', 'Electronics & Communication', '0000-00-00', 0.00),
(720, 'B25cs032', 'Balapanuru Madhusudhan Reddy ', 'Male', 'b25cs032@nitm.ac.in', '6301916146', 'Computer Science', '0000-00-00', 0.00),
(721, 'b25ee032', 'Kornana akash ', 'Male', 'b25ee032@nitm.ac.in', '8143928271', 'Electrical Engineering', '0000-00-00', 0.00),
(722, 'B25EC028 ', 'Nayanjyoti Rabha ', 'Male', 'b25ec028@nitm.ac.in', '7636036069', 'Electronics & Communication', '0000-00-00', 0.00),
(723, '22104022', 'Lunsangmon Lhungdim ', 'Male', '22104022@nitm.ac.in', '8798615586', 'General', '0000-00-00', 0.00),
(724, 'B24CS041', 'MD SAIFUL ISLAM ', 'Male', 'b24cs041@nitm.ac.in', '6033426915', 'Computer Science', '0000-00-00', 0.00),
(725, 'P24CY002 ', 'Daphi Gareane Syiemlieh ', 'Female', 'p24cy002@nitm.ac.in', '9612547435', 'Chemistry', '0000-00-00', 0.00),
(726, 'T25CE001', 'SEYIEKIETO NAKHRO', 'Male', 't25ce001@nitm.ac.in', '8730061838', 'Civil Engineering', '0000-00-00', 0.00),
(727, 'T25CE002', 'Rangkynsai Mylliem Umlong', 'Male', 't25ce002@nitm.ac.in', '9774602292', 'Civil Engineering', '0000-00-00', 0.00),
(728, 'T25CE003', 'YOOBIANGMI SUIAM', 'Male', 't25ce003@nitm.ac.in', '7423933461', 'Civil Engineering', '0000-00-00', 0.00),
(729, 'T25CE004', 'Anurag kumar', 'Male', 't25ce004@nitm.ac.in', '9262777272', 'Civil Engineering', '0000-00-00', 0.00),
(730, 'T25CE005', 'STEFFI KHARWANNIANG', 'Female', 't25ce005@nitm.ac.in', '8787844839', 'Civil Engineering', '0000-00-00', 0.00),
(731, 'T25CE006', 'SHLURBOR KHARNGI', 'Male', 't25ce006@nitm.ac.in', '8787550686', 'Civil Engineering', '0000-00-00', 0.00),
(732, 'T25CE007', 'PHILARI SWER', 'Female', 't25ce007@nitm.ac.in', '8794780607', 'Civil Engineering', '0000-00-00', 0.00),
(733, 'T25CE008', 'Lalhminghlua', 'Male', 't25ce008@nitm.ac.in', '7005670715', 'Civil Engineering', '0000-00-00', 0.00),
(734, 'T25CE009', 'Pynshailang Sohshang', 'Male', 't25ce009@nitm.ac.in', '9366075058', 'Civil Engineering', '0000-00-00', 0.00),
(735, 'T25CE010', 'DIBELSON LYNGKHOI', 'Male', 't25ce010@nitm.ac.in', '6909038492', 'Civil Engineering', '0000-00-00', 0.00),
(736, 'T25CE011', 'Willy Reade Jaba', 'Male', 't25ce011@nitm.ac.in', '7630043265', 'Civil Engineering', '0000-00-00', 0.00),
(737, 'T25CE012', 'IBAJOPLIN SOHTUN', 'Female', 't25ce012@nitm.ac.in', '7627960246', 'Civil Engineering', '0000-00-00', 0.00),
(738, 'T25CE013', 'SATYA NARAYAN DAS', 'Male', 't25ce013@nitm.ac.in', '9861291373', 'Civil Engineering', '0000-00-00', 0.00),
(739, 'T25CS001', 'Tapu Shekhar Saha', 'Male', 't25cs001@nitm.ac.in', '9883542939', 'Computer Science', '0000-00-00', 0.00),
(740, 'T25CS002', 'RITESH KUSHWAHA', 'Male', 't25cs002@nitm.ac.in', '9628545655', 'Computer Science', '0000-00-00', 0.00),
(741, 'T25CS003', 'RWIKHAMUTI BASUMATARY', 'Female', 't25cs003@nitm.ac.in', '9707165575', 'Computer Science', '0000-00-00', 0.00),
(742, 'T25CS004', 'Praveen Kumar', 'Male', 't25cs004@nitm.ac.in', '7398028818', 'Computer Science', '0000-00-00', 0.00),
(743, 'T25CS005', 'Shriya Singh', 'Female', 't25cs005@nitm.ac.in', '6200262146', 'Computer Science', '0000-00-00', 0.00),
(744, 'T25CS006', 'DURGESH NANDANI', 'Female', 't25cs006@nitm.ac.in', '9006531796', 'Computer Science', '0000-00-00', 0.00),
(745, 'T25CS007', 'VISHAKHA', 'Female', 't25cs007@nitm.ac.in', '8307816242', 'Computer Science', '0000-00-00', 0.00),
(746, 'T25CS008', 'Aditya Singh', 'Male', 't25cs008@nitm.ac.in', '7005119720', 'Computer Science', '0000-00-00', 0.00),
(747, 'T25CS009', 'Gattu Nikhilesh', 'Male', 't25cs009@nitm.ac.in', '8019221776', 'Computer Science', '0000-00-00', 0.00),
(748, 'T25CS010', 'MUDRABOINA MALLIKHARJUNA SRINIVASA RAO', 'Male', 't25cs010@nitm.ac.in', '7729876050', 'Computer Science', '0000-00-00', 0.00),
(749, 'T25CS011', 'Divyanshu Rathore', 'Male', 't25cs011@nitm.ac.in', '8005592560', 'Computer Science', '0000-00-00', 0.00),
(750, 'T25CS012', 'Vivek Negi', 'Male', 't25cs012@nitm.ac.in', '8077481802', 'Computer Science', '0000-00-00', 0.00),
(751, 'T25CS013', 'Deepak kumar yadav', 'Male', 't25cs013@nitm.ac.in', '9936812425', 'Computer Science', '0000-00-00', 0.00),
(752, 'T25CS014', 'Diwakar Sharma', 'Male', 't25cs014@nitm.ac.in', '8001382557', 'Computer Science', '0000-00-00', 0.00),
(753, 'T25CS015', 'Anup Kumar Jha', 'Male', 't25cs015@nitm.ac.in', '8240905317', 'Computer Science', '0000-00-00', 0.00),
(754, 'T25CS016', 'ANIRBAN SAHA', 'Male', 't25cs016@nitm.ac.in', '8910868054', 'Computer Science', '0000-00-00', 0.00),
(755, 'T25CS017', 'ENUKONDA SAI KRISHNA', 'Male', 't25cs017@nitm.ac.in', '7995494463', 'Computer Science', '0000-00-00', 0.00),
(756, 'T25CS018', 'SUMIT KESARWANI', 'Male', 't25cs018@nitm.ac.in', '8052993582', 'Computer Science', '0000-00-00', 0.00),
(757, 'T25CS019', 'SAGAR KUMAR', 'Male', 't25cs019@nitm.ac.in', '8630236673', 'Computer Science', '0000-00-00', 0.00),
(758, 'T25CS020', 'NEERAJ KUMAR KANAUJIYA', 'Male', 't25cs020@nitm.ac.in', '9076711340', 'Computer Science', '0000-00-00', 0.00),
(759, 'T25CS021', 'NOANCHI K MARAK', 'Female', 't25cs021@nitm.ac.in', '9366125234', 'Computer Science', '0000-00-00', 0.00),
(760, 'T25CS022', 'ARYAN RAJ BARIK', 'Male', 't25cs022@nitm.ac.in', '8978414409', 'Computer Science', '0000-00-00', 0.00),
(761, 'T25CS024', 'Dhiman Kumar Bose', 'Male', 't25cs023@nitm.ac.in', '8942019975', 'Computer Science', '0000-00-00', 0.00),
(762, 'T25CS025', 'VAKKALAGADDA DRISHTI RAO', 'Female', 't25cs024@nitm.ac.in', '7005595182', 'Computer Science', '0000-00-00', 0.00),
(763, 'T25CS026', 'SHORIF MOHD NASIR ALAM', 'Male', 't25cs025@nitm.ac.in', '8794924746', 'Computer Science', '0000-00-00', 0.00),
(764, 'T25CS027', 'Suraj Rauniyar', 'Male', 't25cs026@nitm.ac.in', '7397281804', 'Computer Science', '0000-00-00', 0.00),
(765, 'T25CS028', 'ANUBHAV PANDEY', 'Male', 't25cs027@nitm.ac.in', '6392009845', 'Computer Science', '0000-00-00', 0.00),
(766, 'T25CS029', 'La i phisha L Lyngwa', 'Female', 't25cs028@nitm.ac.in', '8794079724', 'Computer Science', '0000-00-00', 0.00),
(767, 'T25CS030', 'Sheikh Marriah Rukhser', 'Female', 't25cs029@nitm.ac.in', '9957987888', 'Computer Science', '0000-00-00', 0.00),
(768, 'T25CS031', 'Rearden Rajkumar', 'Male', 't25cs030@nitm.ac.in', '9366752562', 'Computer Science', '0000-00-00', 0.00),
(769, 'T25CS032', 'BANTEILANG KHARPHULI', 'Male', 't25cs031@nitm.ac.in', '9863928930', 'Computer Science', '0000-00-00', 0.00),
(770, 'T25CS033', 'KARUMURU PRABHURAJKUMAR', 'Male', 't25cs033@nitm.ac.in', '7099532419', 'Computer Science', '0000-00-00', 0.00),
(771, 'T25CS034', 'BRAJESH KUMAR', 'Male', 't25cs034@nitm.ac.in', '9346451950', 'Computer Science', '0000-00-00', 0.00),
(772, 'T25CS035', 'SOURAV ROY', 'Male', 't25cs035@nitm.ac.in', '9315044279', 'Computer Science', '0000-00-00', 0.00),
(773, 'T25EC001', 'PANKAJ BHONAJI GAWAI', 'Male', 't25ec001@nitm.ac.in', '8847794517', 'Electronics & Communication', '0000-00-00', 0.00),
(774, 'T25EC002', 'SWAPNENDU DAS', 'Male', 't25ec002@nitm.ac.in', '8101230347', 'Electronics & Communication', '0000-00-00', 0.00),
(775, 'T25EC003', 'BATHULA LAKSHMINARAYANA', 'Male', 't25ec003@nitm.ac.in', '7672007212', 'Electronics & Communication', '0000-00-00', 0.00),
(776, 'T25EC004', 'SAURABH RAI', 'Male', 't25ec004@nitm.ac.in', '9170713259', 'Electronics & Communication', '0000-00-00', 0.00),
(777, 'T25EC005', 'ROLLINGSTONE LAMIN', 'Male', 't25ec005@nitm.ac.in', '7005198092', 'Electronics & Communication', '0000-00-00', 0.00),
(778, 'T25EC006', 'Lapynhunshisha Lyngdoh Mawlong', 'Female', 't25ec006@nitm.ac.in', '9615360855', 'Electronics & Communication', '0000-00-00', 0.00),
(779, 'T25EC007', 'SOUGATA PATRA', 'Male', 't25ec007@nitm.ac.in', '7384910509', 'Electronics & Communication', '0000-00-00', 0.00),
(780, 'T25EE001', 'Hauniwan Dkhar', 'Male', 't25ee001@nitm.ac.in', '9366034673', 'Electrical Engineering', '0000-00-00', 0.00),
(781, 'T25EE002', 'Richmondwell L Kalwing', 'Male', 't25ee002@nitm.ac.in', '7005861573', 'Electrical Engineering', '0000-00-00', 0.00),
(782, 'T25EE003', 'Wailadmi S Manner', 'Male', 't25ee003@nitm.ac.in', '6033326455', 'Electrical Engineering', '0000-00-00', 0.00),
(783, 'T25EE004', 'Endor Chiangkata', 'Male', 't25ee004@nitm.ac.in', '9863221416', 'Electrical Engineering', '0000-00-00', 0.00),
(784, 'T25EE005', 'Queenesabet Jana', 'Female', 't25ee005@nitm.ac.in', '8414082130', 'Electrical Engineering', '0000-00-00', 0.00),
(785, 'T25EE006', 'PULLJOHNSTAR WANNIANG', 'Male', 't25ee006@nitm.ac.in', '8974367232', 'Electrical Engineering', '0000-00-00', 0.00),
(786, 'T25EE007', 'NAYAN NIRBAN BARUAH', 'Male', 't25ee007@nitm.ac.in', '8822304608', 'Electrical Engineering', '0000-00-00', 0.00),
(787, 'T25EE008', 'Birim B Marak', 'Male', 't25ee008@nitm.ac.in', '8257049129', 'Electrical Engineering', '0000-00-00', 0.00);
INSERT INTO `students` (`id`, `student_id`, `name`, `Gender`, `email`, `phone`, `department`, `dob`, `total_costs`) VALUES
(788, 'T25EE009', 'Aidalinshisha Kharkongor', 'Female', 't25ee009@nitm.ac.in', '7630003956', 'Electrical Engineering', '0000-00-00', 0.00),
(789, 'T25EE010', 'Daphinangbet Kharumlong', 'Female', 't25ee010@nitm.ac.in', '8837261543', 'Electrical Engineering', '0000-00-00', 0.00),
(790, 'T25EE011', 'KERDAHUN KHARCHANDY', 'Female', 't25ee011@nitm.ac.in', '9366243076', 'Electrical Engineering', '0000-00-00', 0.00),
(791, 'T25ME001', 'Sweetyhun Nongrum', 'Female', 't25me001@nitm.ac.in', '8787735741', 'Mechanical Engineering', '0000-00-00', 0.00),
(792, 'T25ME002', 'BA ISHONGDOR L LYNGKHOI', 'Female', 't25me002@nitm.ac.in', '8259916774', 'Mechanical Engineering', '0000-00-00', 0.00),
(793, 'T25ME003', 'Richard Neldi Khongstid', 'Male', 't25me003@nitm.ac.in', '9862226213', 'Mechanical Engineering', '0000-00-00', 0.00),
(794, 'T25ME004', 'Dame Hi Paia Dkhar', 'Male', 't25me004@nitm.ac.in', '7085521270', 'Mechanical Engineering', '0000-00-00', 0.00),
(795, 'T25ME005', 'Pyntngenlang Jamu', 'Male', 't25me005@nitm.ac.in', '7005079152', 'Mechanical Engineering', '0000-00-00', 0.00),
(796, 'S25CB001', 'MEGHA GUCHAIT', 'Female', 's25cb001@nitm.ac.in', '8420718162', 'Chemical Engineering', '0000-00-00', 0.00),
(797, 'S25CB002', 'MANAS ADHIKARI', 'Male', 's25cb002@nitm.ac.in', '8609326979', 'Chemical Engineering', '0000-00-00', 0.00),
(798, 'S25CB003', 'ROHIT LAMA', 'Male', 's25cb003@nitm.ac.in', '7086832476', 'Chemical Engineering', '0000-00-00', 0.00),
(799, 'S25CB004', 'Bhaswati Das', 'Female', 's25cb004@nitm.ac.in', '7099800203', 'Chemical Engineering', '0000-00-00', 0.00),
(800, 'S25CB005', 'Nilanjan Barman', 'Male', 's25cb005@nitm.ac.in', '8597497065', 'Chemical Engineering', '0000-00-00', 0.00),
(801, 'S25CB006', 'Th Udit Suraj Singha', 'Male', 's25cb006@nitm.ac.in', '7002404704', 'Chemical Engineering', '0000-00-00', 0.00),
(802, 'S25CB007', 'Deepa Subedi', 'Female', 's25cb007@nitm.ac.in', '8414019564', 'Chemical Engineering', '0000-00-00', 0.00),
(803, 'S25CB008', 'SHREYASHI VEDASHRUTI', 'Female', 's25cb008@nitm.ac.in', '9395747958', 'Chemical Engineering', '0000-00-00', 0.00),
(804, 'S25CB009', 'Madhan P', 'Male', 's25cb009@nitm.ac.in', '8925455764', 'Chemical Engineering', '0000-00-00', 0.00),
(805, 'S25CB010', 'Rimeka Nongdhar', 'Female', 's25cb010@nitm.ac.in', '9612640593', 'Chemical Engineering', '0000-00-00', 0.00),
(806, 'S25CB011', 'Nirmalyo Das', 'Male', 's25cb011@nitm.ac.in', '6002929906', 'Chemical Engineering', '0000-00-00', 0.00),
(807, 'S25CB012', 'Arghadeep Dhar', 'Male', 's25cb012@nitm.ac.in', '8974066365', 'Chemical Engineering', '0000-00-00', 0.00),
(808, 'S25CB013', 'Ankit Das', 'Male', 's25cb013@nitm.ac.in', '6296780617', 'Chemical Engineering', '0000-00-00', 0.00),
(809, 'S25CB014', 'PYNBIANGLIN IAWPHNIAW', 'Female', 's25cb014@nitm.ac.in', '6009844376', 'Chemical Engineering', '0000-00-00', 0.00),
(810, 'S25CB014', 'LABIANGHUN WARJRI', 'Female', 's25cb015@nitm.ac.in', '8118918866', 'Chemical Engineering', '0000-00-00', 0.00),
(811, 'S25CB016', 'BANAMESHA SYIEMLIEH', 'Female', 's25cb016@nitm.ac.in', '7005463031', 'Chemical Engineering', '0000-00-00', 0.00),
(812, 'S25CB017', 'BADAPKYRHAI KHARSOHRMAT', 'Female', 's25cb017@nitm.ac.in', '7628946626', 'Chemical Engineering', '0000-00-00', 0.00),
(813, 'S25CB018', 'FESTARSON LYNGDOH', 'Male', 's25cb018@nitm.ac.in', '9860000000', 'Chemical Engineering', '0000-00-00', 0.00),
(814, 'S25MA001', 'Ratul dutta', 'Male', 's25ma001@nitm.ac.in', '9253484492', 'Mathematics', '0000-00-00', 0.00),
(815, 'S25MA002', 'Souvik Sankar Dutta Roy', 'Male', 's25ma002@nitm.ac.in', '8134000538', 'Mathematics', '0000-00-00', 0.00),
(816, 'S25MA003', 'Bharat Bhushan', 'Male', 's25ma003@nitm.ac.in', '7292062584', 'Mathematics', '0000-00-00', 0.00),
(817, 'S25MA004', 'TIRTHANKAR MRIDHA', 'Male', 's25ma004@nitm.ac.in', '8240860438', 'Mathematics', '0000-00-00', 0.00),
(818, 'S25MA005', 'Bhumika Verma', 'Female', 's25ma005@nitm.ac.in', '8824440163', 'Mathematics', '0000-00-00', 0.00),
(819, 'S25MA006', 'Hanashisha Rosetti Marbaniang', 'Female', 's25ma006@nitm.ac.in', '7085339221', 'Mathematics', '0000-00-00', 0.00),
(820, 'S25MA007', 'Purandar Rabha', 'Male', 's25ma007@nitm.ac.in', '7896852786', 'Mathematics', '0000-00-00', 0.00),
(821, 'S25MA008', 'Himanshu Purohit', 'Male', 's25ma008@nitm.ac.in', '7987550703', 'Mathematics', '0000-00-00', 0.00),
(822, 'S25MA009', 'Saismruti Sabat', 'Female', 's25ma009@nitm.ac.in', '8456050171', 'Mathematics', '0000-00-00', 0.00),
(823, 'S25MA010', 'JOYDARIS L MAWLONG', 'Female', 's25ma010@nitm.ac.in', '6009536495', 'Mathematics', '0000-00-00', 0.00),
(824, 'S25MA011', 'JYOTI FARTYAL', 'Female', 's25ma011@nitm.ac.in', '8433228216', 'Mathematics', '0000-00-00', 0.00),
(825, 'S25MA012', 'MAPHIBANRISHA WANNIANG', 'Female', 's25ma012@nitm.ac.in', '6033172210', 'Mathematics', '0000-00-00', 0.00),
(826, 'S25MA013', 'Himanshu kumar', 'Male', 's25ma013@nitm.ac.in', '6376896473', 'Mathematics', '0000-00-00', 0.00),
(827, 'S25MA014', 'Ankit Sharma', 'Male', 's25ma014@nitm.ac.in', '7999407174', 'Mathematics', '0000-00-00', 0.00),
(828, 'S25MA015', 'IBADAHUNSHISHA KHARDEWSAW', 'Female', 's25ma015@nitm.ac.in', '8415919160', 'Mathematics', '0000-00-00', 0.00),
(829, 'S25MA016', 'Venisha Nongbet', 'Female', 's25ma016@nitm.ac.in', '8794530134', 'Mathematics', '0000-00-00', 0.00),
(830, 'S25MA017', 'HARSHITA MADHUKALYA', 'Female', 's25ma017@nitm.ac.in', '7086198049', 'Mathematics', '0000-00-00', 0.00),
(831, 'S25MA018', 'JESSICA SIANGSHAI', 'Female', 's25ma018@nitm.ac.in', '9774166484', 'Mathematics', '0000-00-00', 0.00),
(832, 'S25MA019', 'Todarisuk warjri', 'Female', 's25ma019@nitm.ac.in', '9863193920', 'Mathematics', '0000-00-00', 0.00),
(833, 'S25MA020', 'BALANIEWKOR LYNGDOH LYNGKHOI', 'Female', 's25ma020@nitm.ac.in', '7005459224', 'Mathematics', '0000-00-00', 0.00),
(834, 'S25PH001', 'Nabashisha Nongshli', 'Female', 's25ph001@nitm.ac.in', '8414023975', 'Physics', '0000-00-00', 0.00),
(835, 'S25PH002', 'SWAGAT KUMAR MOHANTA', 'Male', 's25ph002@nitm.ac.in', '9348550493', 'Physics', '0000-00-00', 0.00),
(836, 'S25PH003', 'Piyalee Mitra', 'Female', 's25ph003@nitm.ac.in', '6901571399', 'Physics', '0000-00-00', 0.00),
(837, 'S25PH004', 'Tonmoy Goswami', 'Male', 's25ph004@nitm.ac.in', '6900602752', 'Physics', '0000-00-00', 0.00),
(838, 'S25PH005', 'Shreya Biswas', 'Female', 's25ph005@nitm.ac.in', '7629895831', 'Physics', '0000-00-00', 0.00),
(839, 'S25PH006', 'KRISHNAPRAKASH P', 'Male', 's25ph006@nitm.ac.in', '7592020417', 'Physics', '0000-00-00', 0.00),
(840, 'S25PH007', 'Shoriful Islam Chowdhury', 'Male', 's25ph007@nitm.ac.in', '8473865324', 'Physics', '0000-00-00', 0.00),
(841, 'S25PH008', 'SANJITI SAWOO', 'Female', 's25ph008@nitm.ac.in', '9717030895', 'Physics', '0000-00-00', 0.00),
(842, 'S25PH009', 'JAYAKUMAR P', 'Male', 's25ph009@nitm.ac.in', '7010597183', 'Physics', '0000-00-00', 0.00),
(843, 'S25PH010', 'SANJU BARIK', 'Male', 's25ph010@nitm.ac.in', '7980964186', 'Physics', '0000-00-00', 0.00),
(844, 'S25PH011', 'AMIT KUMAR VERMA', 'Male', 's25ph011@nitm.ac.in', '8271883642', 'Physics', '0000-00-00', 0.00),
(845, 'S25PH012', 'PHIBANIADA KHARUMNUID', 'Female', 's25ph012@nitm.ac.in', '8729866344', 'Physics', '0000-00-00', 0.00),
(846, 'S25PH013', 'DAPHIBANRI MARBANIANG', 'Female', 's25ph013@nitm.ac.in', '9485362960', 'Physics', '0000-00-00', 0.00),
(847, 'S25PH014', 'BALBARIN KHARJAHRIN', 'Female', 's25ph014@nitm.ac.in', '6009774577', 'Physics', '0000-00-00', 0.00),
(848, 'S25PH015', 'AIBANDARI MARBANIANG', 'Female', 's25ph015@nitm.ac.in', '8415936891', 'Physics', '0000-00-00', 0.00),
(849, 'S25PH016', 'IBANSANI MALNGIANG', 'Female', 's25ph016@nitm.ac.in', '9383305294', 'Physics', '0000-00-00', 0.00),
(850, 'S25PH017', 'Bakhrawkupar L Lyngkhoi', 'Male', 's25ph017@nitm.ac.in', '8258816828', 'Physics', '0000-00-00', 0.00),
(851, 'S25PH018', 'Rideep Choudhury', 'Male', 's25ph018@nitm.ac.in', '6002586504', 'Physics', '0000-00-00', 0.00),
(852, 'S25PH019', 'Bantyngshain Lyngdoh Nongbri', 'Male', 's25ph019@nitm.ac.in', '8837496864', 'Physics', '0000-00-00', 0.00),
(853, 'C25CS001', 'ANMOL SAINI', 'Male', 'c25cs001@nitm.ac.in', '9588450286', 'Computer Science', '0000-00-00', 0.00),
(854, 'C25CS002', 'Saket Kumar', 'Male', 'c25cs002@nitm.ac.in', '8340731522', 'Computer Science', '0000-00-00', 0.00),
(855, 'C25CS003', 'Sudipta Tripura', 'Male', 'c25cs003@nitm.ac.in', '9366157902', 'Computer Science', '0000-00-00', 0.00),
(856, 'C25CS004', 'SWAYAM DIGAL', 'Male', 'c25cs004@nitm.ac.in', '8790021421', 'Computer Science', '0000-00-00', 0.00),
(857, 'C25CS005', 'Aryan Raj', 'Male', 'c25cs005@nitm.ac.in', '8252684501', 'Computer Science', '0000-00-00', 0.00),
(858, 'C25CS006', 'Joshua Muanlal', 'Male', 'c25cs006@nitm.ac.in', '9149433863', 'Computer Science', '0000-00-00', 0.00),
(859, 'C25CS007', 'Nihal Tiwari', 'Male', 'c25cs007@nitm.ac.in', '7999320361', 'Computer Science', '0000-00-00', 0.00),
(860, 'C25CS008', 'KAUSHIK DAS', 'Male', 'c25cs008@nitm.ac.in', '7827045467', 'Computer Science', '0000-00-00', 0.00),
(861, 'C25CS009', 'Mudit tejra', 'Male', 'c25cs009@nitm.ac.in', '9098754040', 'Computer Science', '0000-00-00', 0.00),
(862, 'C25CS010', 'MITRAJSINH ANIRUDDHSINH JADEJA', 'Male', 'c25cs010@nitm.ac.in', '9372629983', 'Computer Science', '0000-00-00', 0.00),
(863, 'C25CS011', 'PAWAN KUMAR NAYAK', 'Male', 'c25cs011@nitm.ac.in', '7667081323', 'Computer Science', '0000-00-00', 0.00),
(864, 'C25CS012', 'NIKHIL SINGH', 'Male', 'c25cs012@nitm.ac.in', '9044652892', 'Computer Science', '0000-00-00', 0.00),
(865, 'C25CS013', 'Deepti', 'Female', 'c25cs013@nitm.ac.in', '9520760631', 'Computer Science', '0000-00-00', 0.00),
(866, 'C25CS014', 'MANISH KUMAR', 'Male', 'c25cs014@nitm.ac.in', '9934571047', 'Computer Science', '0000-00-00', 0.00),
(867, 'C25CS015', 'Rohit kumar', 'Male', 'c25cs015@nitm.ac.in', '9151417168', 'Computer Science', '0000-00-00', 0.00),
(868, 'C25CS016', 'YEDHU KRISHNA Y', 'Male', 'c25cs016@nitm.ac.in', '7356826241', 'Computer Science', '0000-00-00', 0.00),
(869, 'P25CE001', 'Tenisstar Syiemiong', 'Male', 'p25ce001@nitm.ac.in', '8974793320', 'Civil Engineering', '0000-00-00', 0.00),
(870, 'P25CE002', 'Ralsan Vensley Laitthma', 'Male', 'p25ce002@nitm.ac.in', '8974302137', 'Civil Engineering', '0000-00-00', 0.00),
(871, 'P25CE003', 'AIBOK KHASAIN SHABONG', 'Male', 'p25ce003@nitm.ac.in', '7421815165', 'Civil Engineering', '0000-00-00', 0.00),
(872, 'P25CE004', 'Aman Kumar', 'Male', 'p25ce004@nitm.ac.in', '8084942369', 'Civil Engineering', '0000-00-00', 0.00),
(873, 'P25CE005', 'Ebalari Phylla Suchiang', 'Female', 'p25ce005@nitm.ac.in', '9485434199', 'Civil Engineering', '0000-00-00', 0.00),
(874, 'P25CE006', 'SAMUEL BENNETT', 'Male', 'p25ce006@nitm.ac.in', '9366151857', 'Civil Engineering', '0000-00-00', 0.00),
(875, 'P25CS001', 'Sayantan Bose', 'Male', 'p25cs001@nitm.ac.in', '6291116155', 'Computer Science', '0000-00-00', 0.00),
(876, 'P25CS002', 'Abygail Nora Lyngdoh', 'Female', 'p25cs002@nitm.ac.in', '8415949634', 'Computer Science', '0000-00-00', 0.00),
(877, 'P25CS004', 'KHWAIRAKPAM NISHITA DEVI', 'Female', 'p25cs004@nitm.ac.in', '9366361243', 'Computer Science', '0000-00-00', 0.00),
(878, 'P25CS008', 'MANISH KUMAR KUSHWAHA', 'Male', 'p25cs008@nitm.ac.in', '7985411178', 'Computer Science', '0000-00-00', 0.00),
(879, 'P25CS009', 'DHANANJAY BHARGAVA', 'Male', 'p25cs009@nitm.ac.in', '7891271191', 'Computer Science', '0000-00-00', 0.00),
(880, 'P25CS012', 'Shrishti Shiva', 'Female', 'p25cs012@nitm.ac.in', '8083081112', 'Computer Science', '0000-00-00', 0.00),
(881, 'P25EC001', 'DEVARAJ PEGU', 'Male', 'p25ec001@nitm.ac.in', '8638889723', 'Electronics & Communication', '0000-00-00', 0.00),
(882, 'P25EC004', 'PANCHSHEEL HARI GORA', 'Male', 'p25ec004@nitm.ac.in', '9305252201', 'Electronics & Communication', '0000-00-00', 0.00),
(883, 'P25EC005', 'Snigdha Ranee Das', 'Female', 'p25ec005@nitm.ac.in', '9101257452', 'Electronics & Communication', '0000-00-00', 0.00),
(884, 'P25EC006', 'Wanchi Dora M Sangma', 'Female', 'p25ec006@nitm.ac.in', '9485353079', 'Electronics & Communication', '0000-00-00', 0.00),
(885, 'P25EC007', 'SYED ZAHIDUL RIZBI', 'Male', 'p25ec007@nitm.ac.in', '9954244475', 'Electronics & Communication', '0000-00-00', 0.00),
(886, 'P25EC008', 'Partha Pratim Goswami', 'Male', 'p25ec008@nitm.ac.in', '6000616807', 'Electronics & Communication', '0000-00-00', 0.00),
(887, 'P25EE002', 'Joshibala Heisnam', 'Female', 'p25ee002@nitm.ac.in', '9715376047', 'Electrical Engineering', '0000-00-00', 0.00),
(888, 'P25EE003', 'KSHITIJA NAND KUMAR SAKET', 'Male', 'p25ee003@nitm.ac.in', '8109191638', 'Electrical Engineering', '0000-00-00', 0.00),
(889, 'P25ME001', 'Pawan Kumar', 'Male', 'p25me001@nitm.ac.in', '8435409139', 'Mechanical Engineering', '0000-00-00', 0.00),
(890, 'P25ME002', 'Vishal chaudhary', 'Male', 'p25me002@nitm.ac.in', '7485010768', 'Mechanical Engineering', '0000-00-00', 0.00),
(891, 'P25ME004', 'Neelabh Sarma', 'Male', 'p25me004@nitm.ac.in', '8876771654', 'Mechanical Engineering', '0000-00-00', 0.00),
(892, 'P25ME005', 'SACHITANANDA MISHRA', 'Male', 'p25me005@nitm.ac.in', '7008345133', 'Mechanical Engineering', '0000-00-00', 0.00),
(893, 'P25PH001', 'Alfonsius Myrthong', 'Male', 'p25ph001@nitm.ac.in', '8131927787', 'Physics', '0000-00-00', 0.00),
(894, 'P25PH002', 'JOYSHREE HANDIQUE', 'Female', 'p25ph002@nitm.ac.in', '9127017163', 'Physics', '0000-00-00', 0.00),
(895, 'P25PH003', 'Senorita Benedict', 'Female', 'p25ph003@nitm.ac.in', '6002925509', 'Physics', '0000-00-00', 0.00),
(896, 'P25CB001', 'Himangshu Das', 'Male', 'p25cb001@nitm.ac.in', '8876872191', 'Chemical Engineering', '0000-00-00', 0.00),
(897, 'P25CB002', 'DEEPSHIKHA DEY', 'Female', 'p25cb002@nitm.ac.in', '8753969743', 'Chemical Engineering', '0000-00-00', 0.00),
(898, 'P25CB003', 'ANJALI NAREDA', 'Female', 'p25cb003@nitm.ac.in', '8876190321', 'Chemical Engineering', '0000-00-00', 0.00),
(899, 'P25CB004', 'Paiadaka S. Manne', 'Female', 'p25cb004@nitm.ac.in', '6009316795', 'Chemical Engineering', '0000-00-00', 0.00),
(900, 'P25CB005', 'PRIYANK PANDEY', 'Male', 'p25cb005@nitm.ac.in', '7895403725', 'Chemical Engineering', '0000-00-00', 0.00),
(901, 'P25MA002', 'DEBASMITA ROY', 'Female', 'p25ma002@nitm.ac.in', '7679149505', 'Mathematics', '0000-00-00', 0.00),
(902, 'P25MA001', 'JIYARUL HOQUE', 'Male', 'p25ma001@nitm.ac.in', '7363994646', 'Mathematics', '0000-00-00', 0.00),
(903, 'P25HS002', 'Pratisthaa Saikia', 'Female', 'p25hs002@nitm.ac.in', '8472870851', 'General', '0000-00-00', 0.00),
(904, 'P25HS003', 'Saikat Kamal Halder', 'Male', 'p25hs003@nitm.ac.in', '7002478342', 'General', '0000-00-00', 0.00),
(905, 'P25HS004', 'Anirban Banerjee', 'Male', 'p25hs004@nitm.ac.in', '9474009746', 'General', '0000-00-00', 0.00),
(906, 'P25HS005', 'Gargee Sarma', 'Female', 'p25hs005@nitm.ac.in', '6001707759', 'General', '0000-00-00', 0.00),
(907, 'P25HS006', 'DEIMAPHIMO MAWA', 'Female', 'p25hs006@nitm.ac.in', '9615325914', 'General', '0000-00-00', 0.00),
(908, 'P25HS007', 'SAPHIDAMANBHA JYRWA', 'Female', 'p25hs007@nitm.ac.in', '9436373211', 'General', '0000-00-00', 0.00),
(909, 'P25HS008', 'Sudesna Halder', 'Female', 'p25hs008@nitm.ac.in', '9101177942', 'General', '0000-00-00', 0.00),
(910, 'P21EC001', 'Shyamosree Goswami', 'Female', 'p21ec001@nitm.ac.in', '8638304239', 'Electronics & Communication', '0000-00-00', 0.00),
(911, 'S24PH015', 'Mismita Datta ', 'Female', 's24ph015@nitm.ac.in', '8119998577', 'Physics', '0000-00-00', 0.00),
(912, 'P24CE006', 'PAPORI DAS', 'Female', 'p24ce006@nitm.ac.in', '7002692436', 'Civil Engineering', '0000-00-00', 0.00),
(913, 'P22EC003', 'Dolly kumari', 'Female', 'p22ec003@nitm.ac.in', '9582355847', 'Electronics & Communication', '0000-00-00', 0.00),
(914, 'B22EC009', 'Ashirbad Raj Arya', 'Male', 'b22ec009@nitm.ac.in', '9485394026', 'Electronics & Communication', '0000-00-00', 0.00),
(915, 'B23CS006', 'Ribait Phawa ', 'Male', 'b23cs006@nitm.ac.in', '6909027811', 'Computer Science', '0000-00-00', 0.00),
(916, 'T24ME006 ', 'Raktim Jyoti Nath', 'Male', 't24me006@nitm.ac.in', '8721960598', 'Mechanical Engineering', '0000-00-00', 0.00),
(917, 'P24CE011 ', 'PRAGYAN PRIYADARSHINI ', 'Female', 'p24ce011@nitm.ac.in', '7978569162', 'Civil Engineering', '0000-00-00', 0.00),
(918, 'B24ME008', 'Ejeip Mawlong ', 'Male', 'b24me008@nitm.ac.in', '9774424736', 'Mechanical Engineering', '0000-00-00', 0.00),
(919, 'P24CS010', 'Subhrajeet Ganguly', 'Male', 'p24cs010@nitm.ac.in', '8697815361', 'Computer Science', '0000-00-00', 0.00),
(920, 'B24CE025', 'GAININGSTAR PIO KHARNONGKHLAW ', 'Male', 'b24ce025@nitm.ac.in', '8974423509', 'Civil Engineering', '0000-00-00', 0.00),
(921, 'P24CE005', 'Nameirakpam Bimolchandra Meitei ', 'Male', 'p24ce005@nitm.ac.in', '8731862162', 'Civil Engineering', '0000-00-00', 0.00),
(922, 'B24CS022', 'Alfred Hriiziio Chachei', 'Male', 'b24cs022@nitm.ac.in', '8257805386', 'Computer Science', '0000-00-00', 0.00),
(923, 'B23CE010', 'Govindam kumar ', 'Male', 'b23ce010@nitm.ac.in', '9801627936', 'Civil Engineering', '0000-00-00', 0.00),
(924, 'B24ME004', 'Poulomi Das', 'Female', 'b24me004@nitm.ac.in', '9366819439', 'Mechanical Engineering', '0000-00-00', 0.00),
(925, 'S24CB016', 'Hakaru Dkhar ', 'Female', 's24cb016@nitm.ac.in', '9612085347', 'Chemical Engineering', '0000-00-00', 0.00),
(926, 'S24CBO20 ', 'Ruthi Halam ', 'Female', 's24cb020@nitm.ac.in', '9864755015', 'Chemical Engineering', '0000-00-00', 0.00),
(927, 'B24ME019', 'Abhishek Gupta', 'Male', 'b24me019@nitm.ac.in', '8539065207', 'Mechanical Engineering', '0000-00-00', 0.00),
(928, 'B15EC018 ', 'Shiihrani ', 'Female', 'b15ec018@nitm.ac.in', '9615060527', 'Electronics & Communication', '0000-00-00', 0.00),
(929, 'B22CE011', 'Subhajit Khan', 'Male', 'b22ce011@nitm.ac.in', '6296792638', 'Civil Engineering', '0000-00-00', 0.00),
(930, 'B22CS012 ', 'Avinash Kumar Singh ', 'Male', 'b22cs012@nitm.ac.in', '9693643724', 'Computer Science', '0000-00-00', 0.00),
(931, 'B24CS035', 'SHAIK THANVEER ', 'Male', 'b24cs035@nitm.ac.in', '8309764404', 'Computer Science', '0000-00-00', 0.00),
(932, 'P23ME002', 'Jyoti Moni Devi', 'Female', 'p23me002@nitm.ac.in', '9365113365', 'Mechanical Engineering', '0000-00-00', 0.00),
(933, 'P21PH001', 'Shibsankar Si', 'Male', 'p21ph001@nitm.ac.in', '8001755803', 'Physics', '0000-00-00', 0.00),
(934, 'P21CE004', 'Donkupar Francis Marbaniang', 'Male', 'p21ce004@nitm.ac.in', '8797042367', 'Civil Engineering', '0000-00-00', 0.00),
(935, 'T24CE001', 'Pynbhalang Kupar Warlarpih', 'Male', 't24ce001@nitm.ac.in', '7005266465', 'Civil Engineering', '0000-00-00', 0.00),
(936, 'T24CE009', 'Datamlin kma', 'Male', 't24ce009@nitm.ac.in', '8258958305', 'Civil Engineering', '0000-00-00', 0.00),
(937, 'B23EC021 ', 'Shanbok Ramshon ', 'Male', 'b23ec021@nitm.ac.in', '7641903119', 'Electronics & Communication', '0000-00-00', 0.00),
(938, 'B22EEO28 ', 'Shubham Kumar ', 'Male', 'b22ee028@nitm.ac.in', '6201781181', 'Electrical Engineering', '0000-00-00', 0.00),
(939, 'B23CS028', 'Anish jhajharia ', 'Male', 'b23cs028@nitm.ac.in', '9257424849', 'Computer Science', '0000-00-00', 0.00),
(940, 'P24ME007', 'Rishanbor Syiemlieh', 'Male', 'p24me007@nitm.ac.in', '8575897370', 'Mechanical Engineering', '0000-00-00', 0.00),
(941, 'P24CE010', 'Yeshpal ', 'Male', 'p24ce010@nitm.ac.in', '8210313157', 'Civil Engineering', '0000-00-00', 0.00),
(942, 'B24CE005', 'Donclinbath M Sangma', 'Male', 'b24ce005@nitm.ac.in', '7005368806', 'Civil Engineering', '0000-00-00', 0.00),
(943, 'B22EC010', 'Aerio Jobin G Momin', 'Male', 'b22ec010@nitm.ac.in', '8414074701', 'Electronics & Communication', '0000-00-00', 0.00),
(944, 'S24PH020', 'GAURAV RAJ', 'Male', 's24ph020@nitm.ac.in', '8102721237', 'Physics', '0000-00-00', 0.00);

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `set_department_before_insert` BEFORE INSERT ON `students` FOR EACH ROW BEGIN
    -- Only set department if it's not provided or empty
    IF NEW.department IS NULL OR NEW.department = '' THEN
        SET NEW.department = extract_department(NEW.student_id);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Consultant') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `phone`, `password`, `role`, `created_at`) VALUES
(1, 'Admin Shaown', 'b24cs041@nitm.ac.in', '6033426915', 'admin123', 'Admin', '2025-09-28 04:37:39'),
(2, 'Dr. Saiful', 'binarybin2003@gmail.com', '01643352285', 'consult123', 'Consultant', '2025-09-28 04:56:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`consultation_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faculty_id` (`faculty_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `consultation_id` (`consultation_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  
  ADD KEY `consultation_id` (`consultation_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `consultation_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `medicine_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `referral_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=945;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1`
  FOREIGN KEY (`consultation_id`) REFERENCES `consultations`(`consultation_id`);

--
-- Constraints for table `referrals`
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_ibfk_1`
  FOREIGN KEY (`consultation_id`) REFERENCES `consultations`(`consultation_id`);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
