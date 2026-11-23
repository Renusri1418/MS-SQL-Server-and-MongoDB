
USE master;
GO

IF DB_ID('TelecomBillingDB') IS NOT NULL
BEGIN
    ALTER DATABASE TelecomBillingDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE TelecomBillingDB;
END;
GO

CREATE DATABASE TelecomBillingDB;
GO

USE TelecomBillingDB;
GO

-- =========================================
-- TASK 1: CREATE TABLES
-- =========================================

CREATE TABLE Plans (
    PlanID INT PRIMARY KEY,
    PlanName VARCHAR(50) NOT NULL,
    DataLimitGB DECIMAL(10,2) NOT NULL,
    MonthlyPrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE Subscribers (
    SubscriberID INT PRIMARY KEY,
    SubscriberName VARCHAR(100) NOT NULL,
    Circle VARCHAR(50),
    PlanID INT NOT NULL,
    FOREIGN KEY (PlanID) REFERENCES Plans(PlanID)
);

CREATE TABLE CallRecords (
    CallID INT PRIMARY KEY,
    SubscriberID INT NOT NULL,
    CallMinutes INT,
    DataUsedGB DECIMAL(10,2),
    CallDate DATE,
    FOREIGN KEY (SubscriberID) REFERENCES Subscribers(SubscriberID)
);

CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    SubscriberID INT NOT NULL,
    InvoiceDate DATE,
    DueDate DATE,
    Amount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (SubscriberID) REFERENCES Subscribers(SubscriberID)
);

-- =========================================
-- TASK 2: INSERT SAMPLE DATA
-- =========================================

INSERT INTO Plans VALUES
(1, 'Basic', 5, 299),
(2, 'Standard', 15, 499),
(3, 'Premium', 30, 799),
(4, 'Unlimited', 100, 999);

INSERT INTO Subscribers VALUES
(101, 'Arun Kumar', 'Chennai', 1),
(102, 'Priya Sharma', 'Bengaluru', 2),
(103, 'Rahul Verma', 'Hyderabad', 3),
(104, 'Meera Nair', 'Mumbai', 4),
(105, 'Kavya Reddy', 'Chennai', 2),
(106, 'Vikram Singh', 'Delhi', 3),
(107, 'Divya Rao', 'Bengaluru', 1),
(108, 'Sneha Patel', 'Mumbai', 4),
(109, 'Ajay Kumar', 'Chennai', 1),
(110, 'Nisha Gupta', 'Delhi', 2),
(111, 'Rohan Das', 'Kolkata', 3),
(112, 'Ananya Roy', 'Kolkata', 2);

INSERT INTO CallRecords VALUES
(1, 101, 45, 2.50, '2026-01-05'),
(2, 101, 30, 1.20, '2026-01-15'),
(3, 102, 60, 8.50, '2026-01-10'),
(4, 102, 25, 5.00, '2026-02-05'),
(5, 103, 90, 18.00, '2026-02-10'),
(6, 103, 40, 12.00, '2026-02-20'),
(7, 104, 120, 45.00, '2026-03-01'),
(8, 104, 75, 30.00, '2026-03-15'),
(9, 105, 35, 7.00, '2026-03-10'),
(10, 105, 20, 4.00, '2026-03-20'),
(11, 106, 80, 20.00, '2026-04-01'),
(12, 106, 55, 15.00, '2026-04-10'),
(13, 107, 25, 3.00, '2026-04-05'),
(14, 108, 100, 50.00, '2026-05-01'),
(15, 108, 70, 40.00, '2026-05-10'),
(16, 109, 30, 2.00, '2026-05-05'),
(17, 110, 50, 9.00, '2026-06-01'),
(18, 111, 90, 22.00, '2026-06-10'),
(19, 111, 45, 8.00, '2026-06-15'),
(20, 112, 60, 10.00, '2026-06-20');

INSERT INTO Invoices VALUES
(1001, 101, DATEADD(DAY,-40,GETDATE()), DATEADD(DAY,-25,GETDATE()), 299, 'Paid'),
(1002, 102, DATEADD(DAY,-35,GETDATE()), DATEADD(DAY,-20,GETDATE()), 499, 'Paid'),
(1003, 103, DATEADD(DAY,-30,GETDATE()), DATEADD(DAY,-10,GETDATE()), 799, 'Pending'),
(1004, 104, DATEADD(DAY,-45,GETDATE()), DATEADD(DAY,-35,GETDATE()), 999, 'Paid'),
(1005, 105, DATEADD(DAY,-20,GETDATE()), DATEADD(DAY,-5,GETDATE()), 499, 'Pending'),
(1006, 106, DATEADD(DAY,-50,GETDATE()), DATEADD(DAY,-40,GETDATE()), 799, 'Paid'),
(1007, 107, DATEADD(DAY,-15,GETDATE()), DATEADD(DAY,10,GETDATE()), 299, 'Pending'),
(1008, 108, DATEADD(DAY,-60,GETDATE()), DATEADD(DAY,-45,GETDATE()), 999, 'Paid'),
(1009, 109, DATEADD(DAY,-30,GETDATE()), DATEADD(DAY,-20,GETDATE()), 299, 'Pending'),
(1010, 110, DATEADD(DAY,-10,GETDATE()), DATEADD(DAY,5,GETDATE()), 499, 'Pending'),
(1011, 111, DATEADD(DAY,-25,GETDATE()), DATEADD(DAY,-15,GETDATE()), 799, 'Paid'),
(1012, 112, DATEADD(DAY,-5,GETDATE()), DATEADD(DAY,15,GETDATE()), 499, 'Pending');

-- =========================================
-- TASK 1: EIGHT REPORT QUERIES
-- =========================================

-- QUERY 1: Total call minutes per plan
-- Purpose: Calculate total calling minutes for each plan.

SELECT
    P.PlanName,
    SUM(CR.CallMinutes) AS TotalCallMinutes
FROM Plans P
INNER JOIN Subscribers S
    ON P.PlanID = S.PlanID
INNER JOIN CallRecords CR
    ON S.SubscriberID = CR.SubscriberID
GROUP BY P.PlanName
ORDER BY TotalCallMinutes DESC;

-- QUERY 2: Subscribers exceeding their data limit
-- Purpose: Identify subscribers whose total data usage exceeds plan limits.

SELECT
    S.SubscriberID,
    S.SubscriberName,
    P.PlanName,
    P.DataLimitGB,
    SUM(CR.DataUsedGB) AS TotalDataUsed
FROM Subscribers S
INNER JOIN Plans P
    ON S.PlanID = P.PlanID
INNER JOIN CallRecords CR
    ON S.SubscriberID = CR.SubscriberID
GROUP BY
    S.SubscriberID,
    S.SubscriberName,
    P.PlanName,
    P.DataLimitGB
HAVING SUM(CR.DataUsedGB) > P.DataLimitGB
ORDER BY TotalDataUsed DESC;

-- QUERY 3: Month-wise revenue
-- Purpose: Calculate monthly revenue from paid invoices.

SELECT
    FORMAT(InvoiceDate, 'yyyy-MM') AS RevenueMonth,
    SUM(Amount) AS MonthlyRevenue
FROM Invoices
WHERE PaymentStatus = 'Paid'
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY RevenueMonth;

-- QUERY 4: Invoices overdue by more than 15 days
-- Purpose: Identify pending invoices overdue by more than 15 days.

SELECT
    InvoiceID,
    SubscriberID,
    InvoiceDate,
    DueDate,
    Amount,
    DATEDIFF(DAY, DueDate, GETDATE()) AS DaysOverdue
FROM Invoices
WHERE PaymentStatus = 'Pending'
    AND DATEDIFF(DAY, DueDate, GETDATE()) > 15
ORDER BY DaysOverdue DESC;

-- QUERY 5: Subscribers with no usage
-- Purpose: Find subscribers who have no call or data usage records.

SELECT
    S.SubscriberID,
    S.SubscriberName,
    S.Circle,
    P.PlanName
FROM Subscribers S
INNER JOIN Plans P
    ON S.PlanID = P.PlanID
LEFT JOIN CallRecords CR
    ON S.SubscriberID = CR.SubscriberID
WHERE CR.CallID IS NULL;

-- QUERY 6: Average revenue per user (ARPU) by circle
-- Purpose: Calculate average paid invoice amount per subscriber in each circle.

SELECT
    S.Circle,
    ROUND(AVG(I.Amount), 2) AS ARPU
FROM Subscribers S
INNER JOIN Invoices I
    ON S.SubscriberID = I.SubscriberID
WHERE I.PaymentStatus = 'Paid'
GROUP BY S.Circle
ORDER BY ARPU DESC;

-- QUERY 7: Plan popularity
-- Purpose: Count subscribers using each plan.

SELECT
    P.PlanName,
    COUNT(S.SubscriberID) AS SubscriberCount
FROM Plans P
LEFT JOIN Subscribers S
    ON P.PlanID = S.PlanID
GROUP BY P.PlanName
ORDER BY SubscriberCount DESC;

-- QUERY 8: Top 10 data consumers
-- Purpose: Identify subscribers with the highest data consumption.

SELECT TOP 10
    S.SubscriberID,
    S.SubscriberName,
    S.Circle,
    SUM(CR.DataUsedGB) AS TotalDataUsedGB
FROM Subscribers S
INNER JOIN CallRecords CR
    ON S.SubscriberID = CR.SubscriberID
GROUP BY
    S.SubscriberID,
    S.SubscriberName,
    S.Circle
ORDER BY TotalDataUsedGB DESC;

-- =========================================
-- TASK 2: STRING AND DATE FUNCTIONS
-- =========================================

-- Format invoice numbers and due-date status

SELECT
    CONCAT('TEL-', InvoiceID) AS FormattedInvoiceNumber,
    SubscriberID,
    Amount,
    DueDate,
    CASE
        WHEN PaymentStatus = 'Paid'
            THEN 'Paid'
        WHEN DueDate < GETDATE()
            THEN 'Overdue'
        ELSE 'Not Yet Due'
    END AS DueDateStatus
FROM Invoices;

-- Subscriber name formatting

SELECT
    UPPER(SubscriberName) AS CustomerName,
    CONCAT('Circle: ', Circle) AS CircleInformation
FROM Subscribers;

-- Date function demonstration

SELECT
    InvoiceID,
    InvoiceDate,
    DueDate,
    DATEDIFF(DAY, InvoiceDate, DueDate) AS PaymentPeriodDays
FROM Invoices;

-- =========================================
-- TASK 3: NULL BEHAVIOUR
-- =========================================

-- Demonstrate SUM, AVG and COUNT with missing values

SELECT
    COUNT(*) AS TotalRecords,
    COUNT(DataUsedGB) AS RecordsWithData,
    SUM(DataUsedGB) AS TotalData,
    AVG(DataUsedGB) AS AverageData
FROM CallRecords;

-- Insert missing usage rows for selected subscribers

INSERT INTO CallRecords VALUES
(21, 101, NULL, NULL, '2026-07-01'),
(22, 102, NULL, NULL, '2026-07-02'),
(23, 103, NULL, NULL, '2026-07-03');

-- NULL behaviour after inserting missing usage values

SELECT
    COUNT(*) AS TotalRows,
    COUNT(DataUsedGB) AS NonNullDataRows,
    SUM(DataUsedGB) AS SumData,
    AVG(DataUsedGB) AS AverageData
FROM CallRecords;

-- Subscriber with no usage rows demonstration

INSERT INTO Subscribers VALUES
(113, 'Missing Usage Subscriber', 'Chennai', 1);

-- Subscriber 113 has no usage records.
-- Compare missing rows versus NULL values in existing rows.

SELECT
    S.SubscriberID,
    S.SubscriberName,
    COUNT(CR.CallID) AS UsageRecordCount,
    SUM(CR.DataUsedGB) AS TotalDataUsed,
    AVG(CR.DataUsedGB) AS AverageDataUsed
FROM Subscribers S
LEFT JOIN CallRecords CR
    ON S.SubscriberID = CR.SubscriberID
WHERE S.SubscriberID = 113
GROUP BY S.SubscriberID, S.SubscriberName;

-- =========================================
-- TASK 4: PURPOSE OF QUERIES
-- =========================================

-- Query 1: Summarises total calling minutes by plan.
-- Query 2: Detects subscribers consuming data beyond their plan limit.
-- Query 3: Calculates revenue collected from paid invoices by month.
-- Query 4: Identifies pending invoices overdue by more than 15 days.
-- Query 5: Identifies subscribers who have no usage records.
-- Query 6: Calculates ARPU by telecom circle.
-- Query 7: Measures plan popularity based on subscriber count.
-- Query 8: Ranks subscribers by total data consumption.
-- Functions: Formats invoice IDs, names and dates, and determines due status.
-- NULL section: Demonstrates COUNT, SUM and AVG when values are missing.

-- =========================================
-- FINAL CHECK
-- =========================================

SELECT * FROM Plans;
SELECT * FROM Subscribers;
SELECT * FROM CallRecords;
SELECT * FROM Invoices;

PRINT 'DAY 6 SET 3 COMPLETED SUCCESSFULLY';
GO
