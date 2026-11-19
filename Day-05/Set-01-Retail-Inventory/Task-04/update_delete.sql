
USE RetailInventoryDB;
GO

-- ==========================================
-- TASK 4: UPDATE AND DELETE OPERATIONS
-- ==========================================

-- PART 1: UPDATE SUPPLIER PHONE NUMBER

-- Step 1: Display supplier details BEFORE UPDATE
SELECT *
FROM Supplier
WHERE SupplierName = 'ABC Suppliers';

-- Step 2: Correct supplier phone number
UPDATE Supplier
SET SupplierPhone = '9999988888'
WHERE SupplierName = 'ABC Suppliers';

-- Step 3: Display supplier details AFTER UPDATE
SELECT *
FROM Supplier
WHERE SupplierName = 'ABC Suppliers';


-- ==========================================
-- PART 2: DELETE DISCONTINUED PRODUCT
-- ==========================================

-- Step 4: Display product details BEFORE DELETE
SELECT *
FROM Product
WHERE SKU = 'P110';

-- Step 5: Display inventory records of the product
SELECT *
FROM Inventory
WHERE SKU = 'P110';

-- Step 6: Delete related inventory records first
DELETE FROM Inventory
WHERE SKU = 'P110';

-- Step 7: Delete the discontinued product
DELETE FROM Product
WHERE SKU = 'P110';

-- Step 8: Verify product is deleted
SELECT *
FROM Product
WHERE SKU = 'P110';

-- Step 9: Verify related inventory is deleted
SELECT *
FROM Inventory
WHERE SKU = 'P110';
