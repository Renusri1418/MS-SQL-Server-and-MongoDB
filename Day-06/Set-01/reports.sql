
/* ============================================================
   HEXAWARE DAY 6 - SET 1
   RETAIL SALES REPORTING
   Covers all 5 tasks
   SQL Server 2025
   ============================================================ */

-- TASK 1: DATABASE AND TABLE CREATION

IF DB_ID('RetailSalesReportingDB') IS NULL
    CREATE DATABASE RetailSalesReportingDB;
GO

USE RetailSalesReportingDB;
GO

-- Reset tables if the script is run again
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Categories;
GO

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Email VARCHAR(100)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    OrderStatus VARCHAR(30) NOT NULL DEFAULT 'Completed',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL UNIQUE,
    PaymentDate DATE,
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(30) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
GO

-- TASK 1: INSERT SAMPLE DATA

INSERT INTO Customers VALUES
(1, 'Arun Kumar', 'Chennai', 'arun@email.com'),
(2, 'Priya Sharma', 'Bangalore', 'priya@email.com'),
(3, 'Rahul Das', 'Chennai', 'rahul@email.com'),
(4, 'Sneha Rao', 'Hyderabad', 'sneha@email.com'),
(5, 'Karthik S', 'Bangalore', 'karthik@email.com'),
(6, 'Meena Devi', 'Chennai', 'meena@email.com'),
(7, 'Vikram Patel', 'Mumbai', 'vikram@email.com'),
(8, 'Divya Nair', 'Hyderabad', 'divya@email.com');

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home'),
(4, 'Books');

INSERT INTO Products VALUES
(101, 'Laptop', 1, 55000),
(102, 'Smartphone', 1, 25000),
(103, 'Headphones', 1, 3000),
(104, 'Smart Watch', 1, 5000),
(105, 'T-Shirt', 2, 800),
(106, 'Jeans', 2, 1800),
(107, 'Chair', 3, 4500),
(108, 'Table', 3, 7000),
(109, 'SQL Book', 4, 600),
(110, 'Python Book', 4, 750);

INSERT INTO Orders VALUES
(1001, 1, '2026-11-01 10:15:00', 'Completed'),
(1002, 2, '2026-11-01 11:30:00', 'Completed'),
(1003, 1, '2026-11-02 09:00:00', 'Completed'),
(1004, 3, '2026-11-03 12:00:00', 'Completed'),
(1005, 4, '2026-11-04 14:00:00', 'Completed'),
(1006, 2, '2026-11-05 16:30:00', 'Completed'),
(1007, 5, '2026-11-06 10:00:00', 'Completed'),
(1008, 6, '2026-11-07 15:00:00', 'Completed'),
(1009, 1, '2026-11-08 12:30:00', 'Completed'),
(1010, 3, '2026-11-08 17:00:00', 'Completed'),
(1011, 4, '2026-10-15 11:00:00', 'Completed'),
(1012, 5, '2026-10-20 13:00:00', 'Completed'),
(1013, 2, '2026-10-25 14:30:00', 'Completed'),
(1014, 6, '2026-10-28 16:00:00', 'Completed'),
(1015, 7, '2026-11-10 10:00:00', 'Completed');

INSERT INTO OrderItems VALUES
(1, 1001, 101, 1, 55000),
(2, 1001, 103, 2, 3000),
(3, 1002, 102, 1, 25000),
(4, 1002, 105, 2, 800),
(5, 1003, 104, 1, 5000),
(6, 1003, 109, 2, 600),
(7, 1004, 106, 2, 1800),
(8, 1004, 105, 3, 800),
(9, 1005, 107, 1, 4500),
(10, 1005, 108, 1, 7000),
(11, 1006, 101, 1, 55000),
(12, 1006, 109, 1, 600),
(13, 1007, 103, 3, 3000),
(14, 1007, 104, 1, 5000),
(15, 1008, 105, 4, 800),
(16, 1008, 106, 1, 1800),
(17, 1009, 102, 2, 25000),
(18, 1009, 110, 2, 750),
(19, 1010, 108, 1, 7000),
(20, 1010, 107, 2, 4500),
(21, 1011, 101, 1, 55000),
(22, 1011, 103, 1, 3000),
(23, 1012, 105, 5, 800),
(24, 1012, 109, 2, 600),
(25, 1013, 102, 1, 25000),
(26, 1013, 104, 2, 5000),
(27, 1014, 107, 1, 4500),
(28, 1014, 110, 3, 750),
(29, 1015, 103, 2, 3000),
(30, 1015, 105, 1, 800);

INSERT INTO Payments VALUES
(1, 1001, '2026-11-01', 'UPI', 'Paid'),
(2, 1002, '2026-11-01', 'Card', 'Paid'),
(3, 1003, '2026-11-02', 'UPI', 'Paid'),
(4, 1004, '2026-11-03', 'Cash', 'Paid'),
(5, 1005, '2026-11-04', 'Card', 'Paid'),
(6, 1006, '2026-11-05', 'UPI', 'Paid'),
(7, 1007, '2026-11-06', 'UPI', 'Paid'),
(8, 1008, '2026-11-07', 'Cash', 'Paid'),
(9, 1011, '2026-10-15', 'Card', 'Paid'),
(10, 1012, '2026-10-20', 'UPI', 'Paid'),
(11, 1013, '2026-10-25', 'Card', 'Paid'),
(12, 1014, '2026-10-28', 'UPI', 'Paid');
GO

-- ============================================================
-- TASK 1: EIGHT REPORTING QUERIES
-- ============================================================

-- QUERY 1: TOP 5 PRODUCTS BY REVENUE

SELECT TOP 5
    p.ProductName,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalRevenue
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;


-- QUERY 2: MONTH-WISE SALES

SELECT
    YEAR(o.OrderDate) AS SalesYear,
    MONTH(o.OrderDate) AS SalesMonth,
    FORMAT(o.OrderDate, 'MMMM yyyy') AS MonthName,
    SUM(oi.Quantity * oi.UnitPrice) AS MonthlyRevenue
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate),
         FORMAT(o.OrderDate, 'MMMM yyyy')
ORDER BY SalesYear, SalesMonth;


-- QUERY 3: CUSTOMERS WITH MORE THAN THREE ORDERS

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 3;


-- QUERY 4: AVERAGE BASKET VALUE PER CITY

SELECT
    c.City,
    ROUND(AVG(OrderTotal), 2) AS AverageBasketValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN (
    SELECT
        OrderID,
        SUM(Quantity * UnitPrice) AS OrderTotal
    FROM OrderItems
    GROUP BY OrderID
) AS OrderAmounts ON o.OrderID = OrderAmounts.OrderID
GROUP BY c.City
ORDER BY AverageBasketValue DESC;


-- QUERY 5: ORDERS WITHOUT PAYMENT RECORDS

SELECT
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    o.OrderStatus
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;


-- QUERY 6: CUSTOMERS WITH NO ORDERS

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


-- QUERY 7: PRODUCT CATEGORY REVENUE SHARE

SELECT
    cat.CategoryName,
    SUM(oi.Quantity * oi.UnitPrice) AS CategoryRevenue,
    ROUND(
        100.0 * SUM(oi.Quantity * oi.UnitPrice) /
        NULLIF(
            (SELECT SUM(Quantity * UnitPrice) FROM OrderItems),
            0
        ), 2
    ) AS RevenuePercentage
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
GROUP BY cat.CategoryName
ORDER BY CategoryRevenue DESC;


-- QUERY 8: DAY WITH THE HIGHEST SALES

SELECT TOP 1
    CAST(o.OrderDate AS DATE) AS SalesDate,
    SUM(oi.Quantity * oi.UnitPrice) AS DailyRevenue
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
GROUP BY CAST(o.OrderDate AS DATE)
ORDER BY DailyRevenue DESC;


-- ============================================================
-- TASK 2: STRING, DATE AND MATHEMATICAL FUNCTIONS
-- ============================================================

SELECT
    UPPER(c.CustomerName) AS CustomerNameUpper,
    CONCAT(c.CustomerName, ' - ', c.City) AS CustomerDetails,
    o.OrderID,
    DATEDIFF(DAY, o.OrderDate, GETDATE()) AS DaysSinceOrder,
    FORMAT(o.OrderDate, 'dd-MMM-yyyy') AS FormattedOrderDate,
    ROUND(SUM(oi.Quantity * oi.UnitPrice), 2) AS OrderTotal
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
GROUP BY c.CustomerName, c.City, o.OrderID, o.OrderDate
ORDER BY o.OrderID;


-- ============================================================
-- TASK 3: NULL BEHAVIOUR
-- COUNT(*), COUNT(column), AVG(column)
-- ============================================================

SELECT
    COUNT(*) AS TotalPaymentRows,
    COUNT(PaymentMethod) AS NonNullPaymentMethods,
    AVG(CAST(PaymentID AS DECIMAL(10,2))) AS AveragePaymentID
FROM Payments;

-- Demonstration of NULL behaviour using a small sample

SELECT
    COUNT(*) AS TotalRows,
    COUNT(Amount) AS NonNullAmounts,
    AVG(Amount) AS AverageAmount
FROM (
    SELECT CAST(100 AS DECIMAL(10,2)) AS Amount
    UNION ALL
    SELECT CAST(200 AS DECIMAL(10,2))
    UNION ALL
    SELECT CAST(NULL AS DECIMAL(10,2))
) AS NullDemo;


-- ============================================================
-- TASK 4: EXPECTED RESULT DOCUMENTATION
-- ============================================================

-- Query 1: Displays the five highest revenue-generating products.
-- Query 2: Displays total revenue for each month.
-- Query 3: Displays customers who placed more than three orders.
-- Query 4: Calculates average order value for each city.
-- Query 5: Identifies orders without a payment record.
-- Query 6: Identifies customers who have never ordered.
-- Query 7: Calculates each category's share of total revenue.
-- Query 8: Identifies the day with the highest revenue.
-- Functions query: Displays formatted customer and order information.
-- NULL query: Shows how COUNT(*) counts rows, COUNT(column)
--             ignores NULL and AVG ignores NULL values.


-- ============================================================
-- TASK 5: MONGODB AGGREGATION REFERENCE
-- The three pipelines are implemented in reports.js.
-- ============================================================

PRINT 'Set 1 SQL reporting tasks completed.';
GO
