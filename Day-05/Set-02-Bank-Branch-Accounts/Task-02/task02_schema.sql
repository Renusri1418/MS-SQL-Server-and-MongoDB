
-- ============================================
-- DAY 5 - SET 2 - TASK 2
-- BANK BRANCH ACCOUNTS DATABASE
-- ============================================

CREATE DATABASE BankBranchDB;
GO

USE BankBranchDB;
GO

-- 1. CUSTOMER TABLE

CREATE TABLE Customer
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL
);
GO

-- 2. BRANCH TABLE

CREATE TABLE Branch
(
    BranchID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL UNIQUE
);
GO

-- 3. MANAGER TABLE

CREATE TABLE Manager
(
    ManagerID INT IDENTITY(1,1) PRIMARY KEY,
    ManagerName VARCHAR(100) NOT NULL,
    BranchID INT NOT NULL,

    CONSTRAINT FK_Manager_Branch
    FOREIGN KEY (BranchID)
    REFERENCES Branch(BranchID)
    ON DELETE NO ACTION
);
GO

-- 4. ACCOUNT TABLE

CREATE TABLE Account
(
    AccountID INT IDENTITY(1,1) PRIMARY KEY,
    AccountNumber VARCHAR(20) NOT NULL UNIQUE,
    CustomerID INT NOT NULL,
    AccountType VARCHAR(20) NOT NULL,
    BranchID INT NOT NULL,
    ManagerID INT NOT NULL,
    Balance DECIMAL(12,2) NOT NULL DEFAULT 0,

    CONSTRAINT CK_Account_Type
    CHECK (AccountType IN ('Savings', 'Current')),

    CONSTRAINT CK_Savings_Balance
    CHECK (AccountType <> 'Savings' OR Balance >= 0),

    CONSTRAINT FK_Account_Customer
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
    ON DELETE NO ACTION,

    CONSTRAINT FK_Account_Branch
    FOREIGN KEY (BranchID)
    REFERENCES Branch(BranchID)
    ON DELETE NO ACTION,

    CONSTRAINT FK_Account_Manager
    FOREIGN KEY (ManagerID)
    REFERENCES Manager(ManagerID)
    ON DELETE NO ACTION
);
GO

-- 5. TRANSACTION TABLE

CREATE TABLE BankTransaction
(
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    AccountID INT NOT NULL,
    TransactionDate DATETIME NOT NULL DEFAULT GETDATE(),
    TransactionDetails VARCHAR(250) NOT NULL,

    CONSTRAINT FK_Transaction_Account
    FOREIGN KEY (AccountID)
    REFERENCES Account(AccountID)
    ON DELETE NO ACTION
);
GO

-- VERIFY TABLE CREATION

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO
