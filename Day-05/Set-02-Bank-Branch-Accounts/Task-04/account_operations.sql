
USE BankBranchDB;
GO

-- ============================================
-- TASK 4: ACCOUNT OPERATIONS AND FILTERING
-- ============================================

-- PART 1: ADD ACCOUNT OPENING DATE

ALTER TABLE Account
ADD OpenedDate DATE NOT NULL
    CONSTRAINT DF_Account_OpenedDate
    DEFAULT GETDATE();
GO

-- PART 2: INSERT SAMPLE CUSTOMERS

INSERT INTO Customer (CustomerName, Address)
VALUES
('Arun Kumar', 'Chennai'),
('Bala Kumar', 'Bangalore'),
('Charan Raj', 'Hyderabad'),
('Divya Sharma', 'Mumbai'),
('Esha Rani', 'Delhi');
GO

-- PART 3: INSERT BRANCHES

INSERT INTO Branch (BranchName)
VALUES
('Chennai Main Branch'),
('Bangalore Branch'),
('Hyderabad Branch');
GO

-- PART 4: INSERT RELATIONSHIP MANAGERS

INSERT INTO Manager (ManagerName, BranchID)
VALUES
('Ramesh', 1),
('Suresh', 2),
('Karthik', 3);
GO

-- PART 5: INSERT BANK ACCOUNTS

INSERT INTO Account
(AccountNumber, CustomerID, AccountType,
 BranchID, ManagerID, Balance, OpenedDate)
VALUES
('ACC1001', 1, 'Savings', 1, 1, 50000, '2026-07-15'),
('ACC1002', 2, 'Current', 2, 2, 75000, '2026-08-10'),
('ACC1003', 3, 'Savings', 3, 3, 30000, '2026-09-05'),
('ACC1004', 4, 'Current', 1, 1, 90000, '2026-06-20'),
('ACC1005', 5, 'Savings', 2, 2, 15000, '2026-05-12'),
('ACC1006', 1, 'Current', 1, 1, 120000, '2026-07-25');
GO

-- PART 6: VIEW INSERTED ACCOUNTS

SELECT * FROM Account;
GO

-- PART 7: UPDATE ACCOUNT BALANCE

UPDATE Account
SET Balance = 60000
WHERE AccountNumber = 'ACC1001';

SELECT *
FROM Account
WHERE AccountNumber = 'ACC1001';
GO

-- PART 8: DELETE A SAMPLE ACCOUNT

DELETE FROM Account
WHERE AccountNumber = 'ACC1005';

SELECT *
FROM Account
WHERE AccountNumber = 'ACC1005';
GO

-- ============================================
-- PART 9: WHERE WITH AND
-- ============================================

SELECT *
FROM Account
WHERE AccountType = 'Savings'
AND Balance > 20000;
GO

-- ============================================
-- PART 10: WHERE WITH OR
-- ============================================

SELECT *
FROM Account
WHERE BranchID = 1
OR BranchID = 2;
GO

-- ============================================
-- PART 11: WHERE WITH IN
-- ============================================

SELECT *
FROM Account
WHERE AccountType IN ('Savings', 'Current');
GO

-- ============================================
-- PART 12: WHERE WITH BETWEEN
-- LAST COMPLETED QUARTER:
-- JULY 1 TO SEPTEMBER 30, 2026
-- ============================================

SELECT *
FROM Account
WHERE OpenedDate BETWEEN '2026-07-01'
AND '2026-09-30'
AND Balance > 40000;
GO

-- ============================================
-- PART 13: FINAL ACCOUNT REPORT
-- ============================================

SELECT
    Account.AccountNumber,
    Customer.CustomerName,
    Account.AccountType,
    Branch.BranchName,
    Account.Balance,
    Account.OpenedDate
FROM Account
INNER JOIN Customer
    ON Account.CustomerID = Customer.CustomerID
INNER JOIN Branch
    ON Account.BranchID = Branch.BranchID
ORDER BY Account.AccountNumber;
GO
