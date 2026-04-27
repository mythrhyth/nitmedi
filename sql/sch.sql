-- --------------------------------------------------------
-- 1. Create database
-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS medical_center
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE medical_center;

-- --------------------------------------------------------
-- 2. Create tables
-- --------------------------------------------------------

-- users
CREATE TABLE IF NOT EXISTS users (
  user_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(20) DEFAULT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (user_id),
  UNIQUE KEY email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`user_id`, `name`, `email`, `phone`, `password`) VALUES
(1, 'Dr. Saiful', 'binarybin2003@gmail.com', '01643352285', '$2y$12$vhqzkp4YtWlpTkTDKHA4BeSHuGs7yQeLnwyDYnqQesDJouTBRPpIq');



-- Faculty
CREATE TABLE IF NOT EXISTS faculty (
  id INT NOT NULL AUTO_INCREMENT,
  emp_code VARCHAR(50) NOT NULL,
  name VARCHAR(100) NOT NULL,
  designation VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  department VARCHAR(50) NOT NULL,
  total_costs DECIMAL(20,2) DEFAULT '0.00',
  PRIMARY KEY (id),
  UNIQUE KEY emp_code (emp_code),
  UNIQUE KEY email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




-- Medicines
CREATE TABLE IF NOT EXISTS medicines (
  medicine_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  stock INT DEFAULT 0,
  price DECIMAL(10,2) NOT NULL,
  expiry_date DATE DEFAULT NULL,
  PRIMARY KEY (medicine_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Students
CREATE TABLE IF NOT EXISTS students (
  id INT NOT NULL AUTO_INCREMENT,
  student_id VARCHAR(50) DEFAULT NULL,
  name VARCHAR(100) DEFAULT NULL,
  Gender VARCHAR(100) DEFAULT NULL,
  email VARCHAR(100) DEFAULT NULL,
  phone VARCHAR(20) DEFAULT NULL,
  department VARCHAR(100) DEFAULT NULL,
  dob DATE DEFAULT NULL,
  total_costs DECIMAL(20,2) DEFAULT '0.00',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Staff
CREATE TABLE IF NOT EXISTS staff (
  id INT NOT NULL AUTO_INCREMENT,
  staff_id VARCHAR(50) NOT NULL,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  position VARCHAR(50) NOT NULL,
  total_costs DECIMAL(20,2) DEFAULT '0.00',
  PRIMARY KEY (id),
  UNIQUE KEY staff_id (staff_id),
  UNIQUE KEY email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Users
CREATE TABLE IF NOT EXISTS users (
  user_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone VARCHAR(20) DEFAULT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('Admin','Consultant') NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id),
  UNIQUE KEY email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




-- Consultations
CREATE TABLE IF NOT EXISTS consultations (
  consultation_id INT NOT NULL AUTO_INCREMENT,
  patient_type VARCHAR(50) NOT NULL,
  patient_id VARCHAR(20) NOT NULL,
  user_id INT NOT NULL,
  disease_name VARCHAR(255) NOT NULL,
  consultation_date DATE NOT NULL,
  consultation_time TIME NOT NULL,
  triage_priority VARCHAR(50) NOT NULL,
  symptoms TEXT,
  total_price DECIMAL(10,2) DEFAULT '0.00',
  referral_status VARCHAR(10) DEFAULT 'No',
  referral_place VARCHAR(255) DEFAULT NULL,
  referral_reason VARCHAR(255) DEFAULT NULL,
  comments TEXT,
  PRIMARY KEY (consultation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `consultations` (`consultation_id`, `patient_type`, `patient_id`, `user_id`, `disease_name`, `consultation_date`, `consultation_time`, `triage_priority`, `symptoms`, `total_price`, `referral_status`, `referral_place`, `referral_reason`, `comments`) VALUES
(32, 'Student', 'B24CS041', 1, 'Fever', '2025-09-30', '11:14:00', 'Medium', 'running nose\r\n', 0.00, 'No', '', '', ''),
(33, 'Student', 'B24CS041', 1, 'common cold', '2025-09-30', '11:43:00', 'Low', 'fever cough ', 0.00, 'No', '', '', ''),
(34, 'Student', 'B24CS041', 1, 'typhoid', '2025-09-30', '11:55:00', 'High', 'fever commoncold vomit', 0.00, 'No', '', '', ''),
(35, 'Student', 'B24CS001', 1, 'fiewnjs', '2025-10-01', '14:41:00', 'Critical', 'efiaj', 0.00, 'Yes', 'feb\\shfd', 'fubesdj', 'fahEWIk'),
(36, 'Student', 'B24CS001', 1, 'dAKJ', '2025-10-17', '14:45:00', 'Low', 'iejfnAJKL', 0.00, 'No', '', '', ''),
(37, 'Student', 'B24CS001', 1, 'dAKJ', '2025-10-01', '14:47:00', 'Low', 'dAKJ', 0.00, 'No', '', '', ''),
(38, 'Student', 'B24CS011', 1, 'Flu', '2025-10-01', '14:48:00', 'High', 'Sneezing', 0.00, 'No', '', '', ''),
(39, 'Student', 'B24CS011', 1, 'dAKJ', '2025-10-01', '14:50:00', 'Medium', 'fdkja', 0.00, 'No', '', '', ''),
(40, 'Student', 'B24CS002', 1, 'Deja Vu', '2025-10-01', '14:50:00', 'Critical', 'Mohit Das', 0.00, 'No', '', '', ''),
(41, 'Faculty', '02', 1, 'Fever', '2025-09-04', '05:57:00', 'Low', 'Low BP', 10.00, 'No', '', '', ''),
(42, 'Student', 'B24CS002', 1, 'Mohit Das', '2025-09-11', '15:00:00', 'Critical', 'Insecurity', 0.00, 'No', '', '', ''),
(43, 'Student', 'B24CS019', 1, 'Fever', '2025-10-06', '17:18:00', 'Low', 'sneezing', 268.00, 'No', '', '', ''),
(44, 'Student', 'B22CE011', 1, 'Fever', '2025-10-08', '15:26:00', 'Low', 'Sneezing', 245.00, 'No', '', '', '');


-- Prescription
CREATE TABLE IF NOT EXISTS prescription (
  prescription_id INT NOT NULL AUTO_INCREMENT,
  consultation_id INT NOT NULL,
  medicine_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (prescription_id),
  INDEX (consultation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `prescription` 
(`prescription_id`, `consultation_id`, `medicine_id`, `quantity`, `unit_price`, `total_price`, `created_at`) 
VALUES
(1, 32, 1, 3, 10.00, 30.00, '2025-09-29 20:02:54'),
(2, 33, 2, 3, 10.00, 30.00, '2025-09-29 20:10:20'),
(3, 34, 3, 4, 10.00, 40.00, '2025-09-29 20:13:30'),
(4, 35, 4, 2, 10.00, 20.00, '2025-09-29 20:13:30'),
(5, 36, 5, 5, 10.00, 50.00, '2025-09-29 20:53:40'),
(6, 37, 6, 3, 10.00, 30.00, '2025-09-29 20:53:40');



-- Referrals
CREATE TABLE IF NOT EXISTS referrals (
  referral_id INT NOT NULL AUTO_INCREMENT,
  consultation_id INT NOT NULL,
  place VARCHAR(255) NOT NULL,
  reason VARCHAR(255) DEFAULT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (referral_id),
  INDEX (consultation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- 3. Foreign key constraints
-- --------------------------------------------------------
-- 1. Consultations that refer to missing users



ALTER TABLE consultations
  ADD CONSTRAINT fk_consultations_consultant
  FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE prescription
  ADD CONSTRAINT fk_prescription_consultation
  FOREIGN KEY (consultation_id) REFERENCES consultations(consultation_id);

ALTER TABLE prescription
  ADD CONSTRAINT fk_prescription_medicine
  FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id);

ALTER TABLE referrals
  ADD CONSTRAINT fk_referrals_consultation
  FOREIGN KEY (consultation_id) REFERENCES consultations(consultation_id);

-- --------------------------------------------------------
-- 4. Functions
-- --------------------------------------------------------
DROP FUNCTION IF EXISTS extract_department;

DELIMITER $$

CREATE FUNCTION extract_department(student_id VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
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




