# Task 3 – ALTER TABLE Operations

## 1. Adding insurance_id

The `insurance_id` column was added to the Patient table using ALTER TABLE ADD.

**Effect:** The Patient table can now store insurance identification numbers. The column allows NULL values because not every patient may have insurance.

## 2. Renaming the Billing Table

The Billing table was renamed to PatientBilling using the SQL Server stored procedure `sp_rename`.

**Effect:** The table is now accessed using the name PatientBilling instead of Billing.

## 3. Dropping a Constraint

The CHECK constraint `CK_Billing_Amount` was removed from PatientBilling.

**Effect:** The database no longer enforces the non-negative bill amount rule through this constraint. Additional validation would be needed to prevent negative amounts.

## Conclusion

The ALTER TABLE operations demonstrate how database structures can be modified after creation without recreating the entire database.