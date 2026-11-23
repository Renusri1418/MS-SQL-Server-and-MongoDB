# Day 6 – Functions, Aggregation, Grouping and Joins

## Overview

Day 6 focuses on working with SQL Server 2025 and MongoDB 8.0 to generate business reports using functions, aggregate operations, grouping, filtering, joins and MongoDB aggregation pipelines.

The assignment consists of three business scenarios:

1. Retail Sales Reporting
2. Insurance Policy Reporting
3. Telecom Usage and Billing Reporting

Each set involves creating SQL reports, applying database functions, understanding NULL behaviour where required, documenting expected results and implementing MongoDB aggregation pipelines.

---

## Technologies Used

- Microsoft SQL Server 2025
- MongoDB 8.0
- SQL
- MongoDB Query Language (MQL)
- Visual Studio Code
- SQL Server Management Studio (SSMS)
- MongoDB Shell (mongosh)

---

# Set 01 – Retail Sales Reporting

### Business Scenario

The retail sales team requires daily and monthly reports using orders, order items, customers and products data.

### Tasks Performed

1. Created SQL queries for:
   - Top 5 products by revenue
   - Month-wise sales
   - Customers with more than three orders using HAVING
   - Average basket value per city
   - Orders without payment using LEFT JOIN
   - Customers with no orders
   - Product-category revenue share
   - Day with the highest sales

2. Applied string, date and mathematical functions:
   - UPPER()
   - CONCAT()
   - DATEDIFF()
   - FORMAT()
   - ROUND()

3. Demonstrated NULL behaviour using:
   - COUNT(*)
   - COUNT(column)
   - AVG()

4. Documented the purpose and expected result of each query.

5. Prepared MongoDB aggregation pipelines for:
   - Month-wise sales
   - Top products
   - Average basket value

### Deliverables

- `reports.sql`
- `reports.js`
- Expected-results documentation

---

# Set 02 – Insurance Policy Reporting

### Business Scenario

An insurance company's policy-administration team requires management reports involving policies, customers, premiums and claims.

### Tasks Performed

1. Created SQL queries for:
   - Policies expiring in the next 30 days
   - Premium collected per product
   - Customers with more than one active policy
   - Claim ratio per product
   - Policies without claims
   - Average premium by age band
   - Monthly new policies
   - Top 5 agents by premium

2. Applied SQL functions:
   - DATEADD()
   - DATEDIFF()
   - CASE
   - String functions

3. Generated policy age bands and masked policy numbers.

4. Explained the difference between WHERE and HAVING with examples.

5. Documented the purpose and expected output of each query.

6. Prepared MongoDB aggregation pipelines for:
   - Claims per status
   - Average settlement time
   - Top three damage categories

### Deliverables

- `reports.sql`
- `reports.js`
- Expected-results documentation

---

# Set 03 – Telecom Usage and Billing Reporting

### Business Scenario

A telecom operator requires usage and billing summaries using subscribers, plans, call records and invoices.

### Tasks Performed

1. Created SQL queries for:
   - Total call minutes per plan
   - Subscribers exceeding their data limit
   - Month-wise revenue
   - Invoices overdue by more than 15 days
   - Subscribers with no usage
   - Average Revenue Per User (ARPU) by circle
   - Plan popularity
   - Top 10 data consumers

2. Applied string and date functions to:
   - Format invoice numbers
   - Calculate due-date status

3. Demonstrated NULL behaviour using:
   - SUM()
   - AVG()

4. Documented the purpose and expected output of each query.

5. Prepared MongoDB aggregation pipelines for:
   - Hourly usage
   - Average session length
   - Busiest cell tower

### Deliverables

- `reports.sql`
- `reports.js`
- Output documentation

---

## Key Concepts Learned

### 1. Aggregate Functions

Used aggregate functions to summarise data:

- SUM()
- AVG()
- COUNT()
- MIN()
- MAX()

### 2. GROUP BY

Used GROUP BY to organise records into groups based on common column values and generate summary reports.

### 3. HAVING

Used HAVING to filter grouped results based on aggregate conditions.

### 4. SQL Joins

Practised:
- INNER JOIN
- LEFT JOIN

Used joins to retrieve related information from multiple tables.

### 5. SQL Functions

Worked with string, date, mathematical and conditional functions to format data and generate meaningful reports.

### 6. NULL Handling

Understood how NULL values affect aggregate calculations and how COUNT(*), COUNT(column), SUM() and AVG() behave when values are missing.

### 7. MongoDB Aggregation

Practised aggregation pipeline concepts using:
- $match
- $group
- $sort

Used aggregation to generate summaries and analytical reports from document collections.

---

## Learning Outcomes

By completing Day 6, the following concepts are practised:

- Writing business-oriented SQL queries.
- Generating daily and monthly reports.
- Using aggregate functions to summarise data.
- Applying GROUP BY and HAVING.
- Retrieving related data using joins.
- Applying string, date and mathematical functions.
- Understanding NULL behaviour in aggregate operations.
- Comparing relational reporting with document-based aggregation.
- Creating MongoDB aggregation pipelines.
- Documenting query purposes and expected results.

---

## Repository Structure

```text
Day-06/
│
├── README.md
│
├── Set-01/
│   ├── reports.sql
│   ├── reports.js
│   ├── expected_results.md
│   └── Screenshots/
│
├── Set-02/
│   ├── reports.sql
│   ├── reports.js
│   ├── expected_results.md
│   └── Screenshots/
│
└── Set-03/
    ├── reports.sql
    ├── reports.js
    ├── expected_results.md
    └── Screenshots/
```

*Note: The structure lists the intended deliverables. Add each file as its corresponding work is completed.*

---

## Conclusion

Day 6 provides practical experience in SQL reporting, data aggregation, grouping, joins and database functions through three different business scenarios.

The exercises help develop the ability to retrieve, analyse and present structured data using SQL Server and MongoDB.
