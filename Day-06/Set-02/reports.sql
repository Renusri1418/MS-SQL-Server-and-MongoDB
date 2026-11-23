
USE master;
GO

IF DB_ID('InsurancePolicyDB') IS NOT NULL
BEGIN
    ALTER DATABASE InsurancePolicyDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE InsurancePolicyDB;
END;
GO

CREATE DATABASE InsurancePolicyDB;
GO

USE InsurancePolicyDB;
GO

-- =========================================
-- TASK 1: CREATE TABLES
-- =========================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    DOB DATE
);

CREATE TABLE Policies (
    PolicyID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    PolicyType VARCHAR(50),
    Premium DECIMAL(10,2),
    CoverageAmount DECIMAL(12,2),
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(20),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

CREATE TABLE Claims (
    ClaimID INT PRIMARY KEY,
    PolicyID INT NOT NULL,
    ClaimAmount DECIMAL(10,2),
    ClaimDate DATE,
    ClaimStatus VARCHAR(30),

    FOREIGN KEY (PolicyID)
        REFERENCES Policies(PolicyID)
);

-- =========================================
-- TASK 2: INSERT SAMPLE DATA
-- =========================================

INSERT INTO Customers VALUES
(1, 'Arun Kumar', 'Chennai', '1995-04-10'),
(2, 'Priya Sharma', 'Bengaluru', '1990-08-15'),
(3, 'Rahul Verma', 'Hyderabad', '1988-12-20'),
(4, 'Meera Nair', 'Mumbai', '1998-06-05'),
(5, 'Kavya Reddy', 'Chennai', '1992-02-18'),
(6, 'Vikram Singh', 'Delhi', '1985-09-22'),
(7, 'Divya Rao', 'Bengaluru', '2000-11-01'),
(8, 'Sneha Patel', 'Mumbai', '1996-03-12');

INSERT INTO Policies VALUES
(101, 1, 'Health', 12000, 500000, '2025-01-01', '2026-01-01', 'Active'),
(102, 2, 'Life', 18000, 1000000, '2025-02-01', '2026-02-01', 'Active'),
(103, 3, 'Vehicle', 8000, 200000, '2025-03-01', '2026-03-01', 'Active'),
(104, 4, 'Health', 15000, 750000, '2025-04-01', '2026-04-01', 'Active'),
(105, 5, 'Life', 20000, 1500000, '2025-05-01', '2026-05-01', 'Expired'),
(106, 1, 'Vehicle', 9000, 300000, '2025-06-01', '2026-06-01', 'Active'),
(107, 6, 'Health', 10000, 400000, '2025-07-01', '2026-07-01', 'Active'),
(108, 7, 'Life', 22000, 2000000, '2025-08-01', '2026-08-01', 'Active'),
(109, 8, 'Vehicle', 7000, 250000, '2025-09-01', '2026-09-01', 'Active'),
(110, 3, 'Health', 14000, 600000, '2025-10-01', '2026-10-01', 'Expired');

INSERT INTO Claims VALUES
(201, 101, 45000, '2025-02-10', 'Approved'),
(202, 102, 120000, '2025-03-15', 'Approved'),
(203, 103, 25000, '2025-04-20', 'Pending'),
(204, 104, 60000, '2025-05-12', 'Rejected'),
(205, 105, 100000, '2025-06-05', 'Approved'),
(206, 106, 35000, '2025-07-10', 'Pending'),
(207, 107, 50000, '2025-08-18', 'Approved'),
(208, 108, 150000, '2025-09-22', 'Approved'),
(209, 109, 18000, '2025-10-01', 'Rejected'),
(210, 110, 75000, '2025-11-15', 'Pending');

-- =========================================
-- TASK 3: AGGREGATE FUNCTIONS
-- =========================================

-- Total premium collected
SELECT SUM(Premium) AS TotalPremiumCollected
FROM Policies;

-- Average premium
SELECT AVG(Premium) AS AveragePremium
FROM Policies;

-- Maximum coverage amount
SELECT MAX(CoverageAmount) AS MaximumCoverage
FROM Policies;

-- Minimum premium
SELECT MIN(Premium) AS MinimumPremium
FROM Policies;

-- Total number of policies
SELECT COUNT(*) AS TotalPolicies
FROM Policies;

-- =========================================
-- TASK 4: GROUP BY AND HAVING
-- =========================================

-- Policy count by type
SELECT
    PolicyType,
    COUNT(*) AS PolicyCount
FROM Policies
GROUP BY PolicyType;

-- Premium by policy type
SELECT
    PolicyType,
    SUM(Premium) AS TotalPremium
FROM Policies
GROUP BY PolicyType;

-- Policy types with premium above 20000
SELECT
    PolicyType,
    SUM(Premium) AS TotalPremium
FROM Policies
GROUP BY PolicyType
HAVING SUM(Premium) > 20000;

-- Claims by status
SELECT
    ClaimStatus,
    COUNT(*) AS TotalClaims,
    SUM(ClaimAmount) AS TotalClaimAmount
FROM Claims
GROUP BY ClaimStatus;

-- =========================================
-- TASK 5: JOINS
-- =========================================

-- INNER JOIN: customer and policy details
SELECT
    C.CustomerName,
    P.PolicyID,
    P.PolicyType,
    P.Premium,
    P.Status
FROM Customers C
INNER JOIN Policies P
    ON C.CustomerID = P.CustomerID;

-- LEFT JOIN: all customers including customers without policies
SELECT
    C.CustomerName,
    P.PolicyID,
    P.PolicyType
FROM Customers C
LEFT JOIN Policies P
    ON C.CustomerID = P.CustomerID;

-- JOIN THREE TABLES: customer, policy and claims
SELECT
    C.CustomerName,
    P.PolicyID,
    P.PolicyType,
    CL.ClaimID,
    CL.ClaimAmount,
    CL.ClaimStatus
FROM Customers C
INNER JOIN Policies P
    ON C.CustomerID = P.CustomerID
INNER JOIN Claims CL
    ON P.PolicyID = CL.PolicyID;

-- Policies without claims
SELECT
    P.PolicyID,
    P.PolicyType,
    C.CustomerName
FROM Policies P
INNER JOIN Customers C
    ON P.CustomerID = C.CustomerID
LEFT JOIN Claims CL
    ON P.PolicyID = CL.PolicyID
WHERE CL.ClaimID IS NULL;

-- =========================================
-- FUNCTIONS
-- =========================================

-- String function
SELECT
    UPPER(CustomerName) AS UpperName,
    LOWER(City) AS LowerCity
FROM Customers;

-- Date function
SELECT
    CustomerName,
    DOB,
    DATEDIFF(YEAR, DOB, GETDATE()) AS ApproxAge
FROM Customers;

-- Math function
SELECT
    PolicyID,
    Premium,
    ROUND(Premium * 1.05, 2) AS PremiumWith5PercentIncrease
FROM Policies;

-- Conditional function
SELECT
    PolicyID,
    Premium,
    CASE
        WHEN Premium >= 15000 THEN 'High Premium'
        WHEN Premium >= 10000 THEN 'Medium Premium'
        ELSE 'Low Premium'
    END AS PremiumCategory
FROM Policies;

-- =========================================
-- FINAL CHECK
-- =========================================

SELECT * FROM Customers;
SELECT * FROM Policies;
SELECT * FROM Claims;

PRINT 'DAY 6 SET 2 COMPLETED SUCCESSFULLY';
GO
