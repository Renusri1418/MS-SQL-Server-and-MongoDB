
USE BankBranchDB;
GO

-- ============================================
-- TASK 3: DROP, TRUNCATE AND DELETE
-- ============================================

-- CREATE TEST TABLE

CREATE TABLE OperationTest
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL
);
GO

-- INSERT SAMPLE RECORDS

INSERT INTO OperationTest (EmployeeName)
VALUES
('Arun'),
('Bala'),
('Charan'),
('Divya'),
('Esha');
GO

-- VIEW ORIGINAL RECORDS

SELECT * FROM OperationTest;

-- ============================================
-- PART 1: DELETE
-- ============================================

DELETE FROM OperationTest
WHERE ID = 2;

-- CHECK REMAINING RECORDS

SELECT * FROM OperationTest;

-- CHECK IDENTITY AFTER DELETE

INSERT INTO OperationTest (EmployeeName)
VALUES ('Farhan');

SELECT * FROM OperationTest;
GO

-- ============================================
-- PART 2: TRUNCATE
-- ============================================

TRUNCATE TABLE OperationTest;

-- CHECK RECORDS AFTER TRUNCATE

SELECT * FROM OperationTest;

-- INSERT AGAIN TO CHECK IDENTITY RESET

INSERT INTO OperationTest (EmployeeName)
VALUES ('Geetha');

SELECT * FROM OperationTest;
GO

-- ============================================
-- PART 3: DROP
-- ============================================

DROP TABLE OperationTest;

-- VERIFY TABLE REMOVAL

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'OperationTest';
GO