
-- ============================================
-- DAY 5 - SET 3 - TASK 3
-- ALTER TABLE OPERATIONS
-- ============================================

USE HospitalRecordsDB;
GO

-- PART 1: ADD INSURANCE_ID COLUMN

ALTER TABLE Patient
ADD insurance_id VARCHAR(30) NULL;
GO

-- VERIFY NEW COLUMN

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Patient';
GO

-- PART 2: RENAME BILLING TABLE

EXEC sp_rename 'Billing', 'PatientBilling';
GO

-- VERIFY TABLE RENAMING

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO

-- PART 3: DROP A CHECK CONSTRAINT

ALTER TABLE PatientBilling
DROP CONSTRAINT CK_Billing_Amount;
GO

-- VERIFY REMAINING CONSTRAINTS

SELECT
    name AS ConstraintName,
    type_desc AS ConstraintType
FROM sys.objects
WHERE parent_object_id = OBJECT_ID('PatientBilling');
GO

-- END OF TASK 3
