
-- ============================================
-- DAY 5 - SET 3 - TASK 2
-- HOSPITAL PATIENT RECORDS DATABASE
-- ============================================

CREATE DATABASE HospitalRecordsDB;
GO

USE HospitalRecordsDB;
GO

-- 1. DEPARTMENT TABLE

CREATE TABLE Department
(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
GO

-- 2. PATIENT TABLE

CREATE TABLE Patient
(
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL
);
GO

-- 3. DOCTOR TABLE

CREATE TABLE Doctor
(
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,

    CONSTRAINT FK_Doctor_Department
    FOREIGN KEY (DepartmentID)
    REFERENCES Department(DepartmentID)
    ON DELETE NO ACTION
);
GO

-- 4. VISIT TABLE

CREATE TABLE Visit
(
    VisitID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    VisitDate DATE NOT NULL DEFAULT GETDATE(),
    Diagnosis VARCHAR(200) NOT NULL,
    Prescription VARCHAR(250),
    ClinicalNotes VARCHAR(500),

    CONSTRAINT CK_Visit_Date
    CHECK (VisitDate <= CAST(GETDATE() AS DATE)),

    CONSTRAINT FK_Visit_Patient
    FOREIGN KEY (PatientID)
    REFERENCES Patient(PatientID)
    ON DELETE NO ACTION,

    CONSTRAINT FK_Visit_Doctor
    FOREIGN KEY (DoctorID)
    REFERENCES Doctor(DoctorID)
    ON DELETE NO ACTION
);
GO

-- 5. BILLING TABLE

CREATE TABLE Billing
(
    BillingID INT IDENTITY(1,1) PRIMARY KEY,
    VisitID INT NOT NULL UNIQUE,
    BillAmount DECIMAL(10,2) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL DEFAULT 'Open',

    CONSTRAINT CK_Billing_Amount
    CHECK (BillAmount >= 0),

    CONSTRAINT DF_Billing_Status
    DEFAULT 'Open' FOR PaymentStatus,

    CONSTRAINT FK_Billing_Visit
    FOREIGN KEY (VisitID)
    REFERENCES Visit(VisitID)
    ON DELETE NO ACTION
);
GO

-- VERIFY TABLES

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO
