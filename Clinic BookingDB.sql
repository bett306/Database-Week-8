-- This is to create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS clinic_bookingDB;

USE clinic_bookingDB;
-- Patient Table
CREATE TABLE patient(
patient_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth DATE,
gender ENUM('Male', 'Female', 'Other'),
phone_number VARCHAR(20) UNIQUE,
email VARCHAR(80) UNIQUE
);

-- Doctor Table
CREATE TABLE doctor(
doctor_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
specialty VARCHAR(100) NOT NULL,
phone VARCHAR(15) UNIQUE,
email VARCHAR(100) UNIQUE
);

-- Service Table
CREATE TABLE service(
service_id INT AUTO_INCREMENT PRIMARY KEY,
service_name VARCHAR(100) NOT NULL UNIQUE,
description TEXT,
cost DECIMAL(10, 2) NOT NULL
);

-- Appointment Table (many-to-one: patient and doctor relating to appointment)
CREATE TABLE appointment(
appointment_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT NOT NULL,
doctor_id INT NOT NULL,
appointment_date DATETIME NOT NULL,
status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

-- Appointment_Service Table (Many-to-Many: appointments relating to services)
CREATE TABLE appointment_service(
appointment_id INT NOT NULL,
service_id INT NOT NULL,
PRIMARY KEY (appointment_id, service_id),
FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id),
FOREIGN KEY (service_id) REFERENCES service(service_id)
);

-- Below is the sample data inserted into the database
-- This is to illustrate clearly proper constraints and the various relationships

-- Insert Patients
INSERT INTO patient (first_name, last_name, date_of_birth, gender, phone_number, email)
VALUES ('Mathew', 'Nekesa', '1990-06-15', 'Female', '0712345678', 'mathew@gmail.com'),
('Holly', 'Winston', '1985-02-20', 'Male', '0723456789', 'hollyzee@gmail.com'),
('Barry', 'Allen', '1992-11-30', 'Female', '0734567890', 'flash@gmail.com');

-- Insert Doctors
INSERT INTO doctor(full_name, specialty, phone, email)
VALUES ('Dr. Tony Stark', 'Cardiology', '0745678901', 'tonystark@avengers.com'),
('Dr. Strang Vincent', 'Dermatology', '0756789012', 'strange@avengers.com');

-- Insert Services
INSERT INTO service(service_name, description, cost)
VALUES ('General Checkup', 'Routine health examination.', 50.00),
('Skin Consultation', 'Diagnosis and treatment of skin issues.', 80.00),
('Cardiac Screening', 'Heart health screening and tests.', 120.00);

-- Insert Appointments
INSERT INTO appointment(patient_id, doctor_id, appointment_date, status)
VALUES (1, 1, '2025-05-15 10:00:00', 'Scheduled'),
(2, 2, '2025-05-16 14:30:00', 'Scheduled'),
(3, 1, '2025-05-17 09:00:00', 'Scheduled');

-- Insert Appointment Services (many-to-many)
INSERT INTO appointment_service(appointment_id, service_id)
VALUES (1, 1), -- Mathew has a general checkup
(2, 2), -- Holly has a skin consultation
(3, 1), -- Barry has a general checkup
(3, 3); -- Barry also has cardiac screening
