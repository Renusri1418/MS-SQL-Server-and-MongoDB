# SQL Server & MongoDB — Database Assignments (Days 5–10)

**Program:** Hexaware Mavericks Segue 2026 — Python Track  
**Focus:** SQL Server 2025 and MongoDB 8.0  
**Assignment status:** ✅ Completed and executed (as reported by the author)

## Overview

This repository documents the hands-on database assignments completed from **Day 5 through Day 10**. The exercises progress from database design and normalization to analytical queries, transactions, reusable database objects, triggers, and MongoDB change detection.

The assignments use realistic scenarios from retail, banking, healthcare, insurance, logistics, airlines, and telecommunications. They explore both **relational database operations in SQL Server** and **document-oriented operations in MongoDB**.

> **Execution note:** The author has executed the assignments. This README summarizes the supplied assignment briefs; it does not independently validate execution results or assume that every example file below is present in this repository.

## Technology Stack

| Technology | Purpose |
|---|---|
| Microsoft SQL Server 2025 | Relational schemas, queries, transactions, views, procedures, functions, and triggers |
| Transact-SQL (T-SQL) | SQL Server scripts and database programming |
| MongoDB 8.0 | Document collections, aggregation, lookups, views, transactions, and change streams |
| JavaScript / `mongosh` | Executing MongoDB commands and scripts |

## Assignment Summary

| Day | Topic | Business scenarios | Status |
|---|---|---|---|
| 05 | Databases, Normalisation & Data Definition | Retail inventory and reviews; bank accounts and activity; hospital records and clinical notes | ✅ Executed |
| 06 | Functions, Aggregation, Grouping & Joins | Retail sales; insurance policy reporting; telecom usage and billing | ✅ Executed |
| 07 | Joins, Subqueries & Lookups | Logistics shipments; bank loan portfolio; retail returns and refunds | ✅ Executed |
| 08 | CTEs, Window Functions & Transactions | Bank funds transfer; airline seat booking; retail inventory reservation | ✅ Executed |
| 09 | Views, Stored Procedures, Functions & Cursors | Retail order fulfilment; insurance premium processing; telecom low-balance follow-up | ✅ Executed |
| 10 | Triggers & Change Detection | Retail price audit; bank balance protection; hospital bed capacity | ✅ Executed |

## Day-wise Work

### Day 05 — Databases, Normalisation and Data Definition

**Concepts:** Database design, normalization to 3NF/BCNF, entity–relationship diagrams, primary and foreign keys, constraints, DDL, DML, and MongoDB collections.

**Exercises:**
- **Retail inventory and product reviews:** Normalize inventory data; define relationships and constraints; test invalid inserts; perform updates/deletes; validate MongoDB review documents.
- **Bank branch accounts and customer activity:** Normalize customer and account records; compare `DROP`, `TRUNCATE`, and `DELETE`; apply filtering; maintain customer activity logs in MongoDB.
- **Hospital patient records and clinical notes:** Separate patient, doctor, department, visit, and billing data; alter database structures; model flexible clinical notes as documents.

**Key skills:** Data integrity, schema design, `CREATE`/`ALTER`, `INSERT`/`UPDATE`/`DELETE`, `WHERE`, `$jsonSchema`, `insertMany`, `find`, `updateOne`, and `deleteOne`.

### Day 06 — Functions, Aggregation, Grouping and Joins

**Concepts:** Built-in SQL functions, aggregate queries, `GROUP BY`, `HAVING`, SQL joins, NULL handling, and MongoDB aggregation.

**Exercises:**
- **Retail sales reporting:** Calculate product revenue, monthly sales, basket values, customer order counts, and unpaid orders.
- **Insurance policy reporting:** Report expiring policies, premium collection, claim ratios, agent performance, and policy age bands.
- **Telecom usage and billing:** Analyze call minutes, usage limits, overdue invoices, average revenue per user, and plan popularity.

**Key skills:** `COUNT`, `SUM`, `AVG`, `ROUND`, `DATEDIFF`, `DATEADD`, `CASE`, `LEFT JOIN`, `$match`, `$group`, and `$sort`.

### Day 07 — Joins, Subqueries and Lookups

**Concepts:** `INNER`, `LEFT`, `FULL`, and self joins; correlated and nested subqueries; `IN`, `EXISTS`, `NOT EXISTS`, `ANY`, `ALL`; and MongoDB `$lookup`.

**Exercises:**
- **Logistics shipment analysis:** Investigate delayed shipments, hubs without outbound shipments, carrier performance, and shipping costs.
- **Bank loan portfolio:** Review overdue repayments, cross-branch borrowers, guarantors, and loan exposure.
- **Retail returns and refunds:** Evaluate return rates, unmatched refunds, store refund totals, and the `NOT IN`/NULL pitfall.

**Key skills:** Matching and unmatched records, join selection, nested queries, and relating MongoDB documents.

### Day 08 — CTEs, Window Functions and Transactions

**Concepts:** Common table expressions, correlated subqueries, window functions, ACID, isolation levels, and SQL Server/MongoDB transactions.

**Exercises:**
- **Bank funds transfer:** Validate account balances; commit or roll back transfers; use savepoints; generate transaction statements.
- **Airline seat booking:** Handle competing reservations; compare isolation levels; rank fares and calculate running revenue.
- **Retail inventory reservation:** Reserve stock atomically; roll back on insufficient stock; rank products and analyze month-on-month sales.

**Key skills:** `BEGIN TRAN`, `COMMIT`, `ROLLBACK`, `TRY...CATCH`, `THROW`, CTEs, `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`, and `SUM() OVER`.

### Day 09 — Views, Stored Procedures, Functions and Cursors

**Concepts:** SQL Server views, stored procedures, scalar and table-valued functions, cursors, set-based operations, and MongoDB views.

**Exercises:**
- **Retail order fulfilment:** Create order and low-stock views; place orders through a stored procedure; calculate order totals; handle pending-order follow-ups.
- **Insurance premium processing:** Report policies due for renewal; validate renewals; calculate discounts; identify lapsed policies.
- **Telecom low-balance follow-up:** Expose prepaid data; process recharges; calculate validity; generate low-balance notifications.

**Key skills:** `CREATE VIEW`, `WITH CHECK OPTION`, input/output parameters, functions, cursor processing versus `INSERT...SELECT`, and `db.createView()`.

### Day 10 — Triggers and Change Detection

**Concepts:** `AFTER` and `INSTEAD OF` triggers, `inserted`/`deleted` pseudo-tables, auditing, multi-row operations, trigger pitfalls, and MongoDB change streams.

**Exercises:**
- **Retail price change audit:** Record price changes; reject prices below cost; test single- and multi-row updates; watch MongoDB price changes.
- **Bank account balance guard:** Audit account transaction changes; prevent invalid negative savings balances; examine nested and recursive triggers; monitor fraud alerts.
- **Hospital bed capacity control:** Prevent admissions beyond capacity; audit admissions; test multi-row inserts; monitor critical ward alerts.

**Key skills:** Set-based trigger design, database rule enforcement, audit trails, error handling, and MongoDB change streams (requiring an appropriate replica-set or sharded deployment).

## Deliverable Types Covered

The assignment briefs request SQL scripts, MongoDB scripts, ER diagrams, result/evidence documentation, and comparison notes. Examples of filenames from the briefs are:

| Day | Example deliverable filenames |
|---|---|
| 05 | `schema.sql`, `seed_data.sql`, `collections.js` |
| 06 | `reports.sql`, `reports.js` |
| 07 | `advanced_reports.sql`, `reports.js` |
| 08 | `transfer.sql`, `statement_cte.sql`, `transaction.js`, `booking_transaction.sql`, `ranking_report.sql`, `booking_txn.js`, `reservation.sql`, `rank_report.sql`, `stock_update.js` |
| 09 | `views.sql`, `procedures.sql`, `cursor.sql`, `mongo_view.js` |
| 10 | `triggers.sql`, `test_evidence.sql`, `watch_changes.js`, `watch_alerts.js`, `watch_wards.js` |

*These are assignment-defined deliverable names, not a verified inventory of files in this repository. Some filenames are reused across scenarios; keep scenario-specific work in separate folders if publishing the scripts.*

## How to Run the Scripts

1. Install or connect to a compatible **SQL Server** instance and open the T-SQL scripts in your preferred SQL client (for example, SQL Server Management Studio).
2. Review each script's database name, dependencies, and setup statements before running it. Execute schema/seed scripts before queries, procedures, or triggers that depend on those objects.
3. For MongoDB exercises, connect with `mongosh` to an appropriate MongoDB environment and run the relevant `.js` scripts.
4. For **Day 08 transactions** and **Day 10 change streams**, confirm the MongoDB deployment supports the required transactional or change-stream features.
5. Test rollback, validation, constraint, and trigger examples in a **non-production database**. Some exercises deliberately produce errors or modify/delete test records.

Example commands (replace paths and database names with those used in your work):

```bash
# Execute a MongoDB script in mongosh
mongosh "mongodb://localhost:27017/your_database" --file path/to/script.js

# Run SQL Server scripts using sqlcmd (if installed)
sqlcmd -S YOUR_SERVER -d YOUR_DATABASE -E -i path/to/script.sql
```

The `-E` example uses Windows integrated authentication; other environments may require different connection options.

## Learning Outcomes

By completing these assignments, I gained hands-on practice with:

- Designing normalized relational schemas and enforcing integrity constraints.
- Writing analytical reports with joins, grouping, SQL functions, and subqueries.
- Using window functions and CTEs for advanced reporting.
- Protecting data consistency through transactions, error handling, and isolation levels.
- Encapsulating database logic in views, stored procedures, and functions.
- Comparing cursors with set-based SQL operations.
- Auditing and validating changes with SQL Server triggers.
- Modeling documents and using aggregation, `$lookup`, views, transactions, and change streams in MongoDB.

## Completion Status

**Days 05–10: Completed and executed.** The README describes the assignment scope and the author's reported completion. Detailed query output, screenshots, or script-by-script evidence can be included alongside the corresponding submissions.

---

**Training:** Hexaware Mavericks Segue 2026 — Python Track  
**Assignment reference:** Day 05 to Day 10 briefs supplied for this repository.
