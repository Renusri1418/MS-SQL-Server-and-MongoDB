
-- ============================================
-- DAY 5 - SET 3 - TASK 4
-- HOSPITAL DATA OPERATIONS
-- ============================================

USE HospitalRecordsDB;
GO

-- PART 1: INSERT DEPARTMENTS

INSERT INTO Department (DepartmentName)
VALUES
('Cardiology'),
('Neurology'),
('Orthopedics');
GO

-- PART 2: INSERT PATIENTS

INSERT INTO Patient (PatientName, Address, insurance_id)
VALUES
('Arun Kumar', 'Chennai', 'INS1001'),
('Bala Sharma', 'Bangalore', 'INS1002'),
('Charan Raj', 'Hyderabad', NULL),
('Divya Rani', 'Chennai', 'INS1004'),
('Esha Thomas', 'Mumbai', NULL);
GO

-- PART 3: INSERT DOCTORS

INSERT INTO Doctor (DoctorName, DepartmentID)
VALUES
('Dr. Ramesh', 1),
('Dr. Suresh', 2),
('Dr. Karthik', 3),
('Dr. Priya', 1);
GO

-- PART 4: INSERT VISIT RECORDS

INSERT INTO Visit
(PatientID, DoctorID, VisitDate, Diagnosis, Prescription, ClinicalNotes)
VALUES
(1, 1, '2026-10-05', 'Heart Pain', 'Medication A', 'Patient is stable'),
(2, 2, '2026-10-10', 'Migraine', 'Medication B', 'Regular monitoring'),
(3, 3, '2026-10-15', 'Joint Pain', 'Medication C', 'Follow-up required'),
(4, 4, '2026-10-20', 'Chest Discomfort', 'Medication D', 'Further observation'),
(5, 2, '2026-11-05', 'Headache', 'Medication E', 'Patient improving');
GO

-- PART 5: INSERT BILLING RECORDS

INSERT INTO PatientBilling
(VisitID, BillAmount)
VALUES
(1, 2500),
(2, 1800),
(3, 3000),
(4, 2200),
(5, 1500);
GO

-- PART 6: VIEW INSERTED PATIENTS AND VISITS

SELECT * FROM Patient;
SELECT * FROM Visit;
SELECT * FROM PatientBilling;
GO

-- ============================================
-- PART 7: UPDATE PATIENT ADDRESS
-- ============================================

UPDATE Patient
SET Address = 'Coimbatore'
WHERE PatientID = 1;

SELECT *
FROM Patient
WHERE PatientID = 1;
GO

-- ============================================
-- PART 8: DELETE A VISIT
-- ============================================

-- Delete its billing record first
DELETE FROM PatientBilling
WHERE VisitID = 5;

-- Delete the corresponding visit
DELETE FROM Visit
WHERE VisitID = 5;

-- Verify deletion
SELECT *
FROM Visit
WHERE VisitID = 5;
GO

-- ============================================
-- PART 9: RETRIEVE PATIENTS VISITED
-- IN OCTOBER 2026
-- ============================================

SELECT
    Patient.PatientID,
    Patient.PatientName,
    Visit.VisitDate,
    Visit.Diagnosis
FROM Patient
INNER JOIN Visit
    ON Patient.PatientID = Visit.PatientID
WHERE Visit.VisitDate >= '2026-10-01'
AND Visit.VisitDate < '2026-11-01';
GO

-- ============================================
-- PART 10: FIND DOCTORS IN CARDIOLOGY
-- USING WHERE AND LIKE
-- ============================================

SELECT
    Doctor.DoctorID,
    Doctor.DoctorName,
    Department.DepartmentName
FROM Doctor
INNER JOIN Department
    ON Doctor.DepartmentID = Department.DepartmentID
WHERE Department.DepartmentName LIKE '%Cardio%';
GO

-- ============================================
-- PART 11: FINAL HOSPITAL REPORT
-- ============================================

SELECT
    Patient.PatientName,
    Doctor.DoctorName,
    Department.DepartmentName,
    Visit.VisitDate,
    Visit.Diagnosis,
    PatientBilling.BillAmount,
    PatientBilling.PaymentStatus
FROM Visit
INNER JOIN Patient
    ON Visit.PatientID = Patient.PatientID
INNER JOIN Doctor
    ON Visit.DoctorID = Doctor.DoctorID
INNER JOIN Department
    ON Doctor.DepartmentID = Department.DepartmentID
LEFT JOIN PatientBilling
    ON Visit.VisitID = PatientBilling.VisitID
ORDER BY Visit.VisitDate;
GO
