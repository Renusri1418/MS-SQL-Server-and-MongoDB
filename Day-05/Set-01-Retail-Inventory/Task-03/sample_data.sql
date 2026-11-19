USE RetailInventoryDB;
GO

INSERT INTO Supplier (SupplierName, SupplierPhone)
VALUES
('ABC Suppliers', '9876543210'),
('XYZ Traders', '9876501234'),
('Global Electronics', '9876512345');

INSERT INTO Category (CategoryName)
VALUES
('Electronics'),
('Accessories'),
('Home Appliances'),
('Furniture');

INSERT INTO Warehouse (WarehouseName)
VALUES
('Chennai Warehouse'),
('Bangalore Warehouse'),
('Hyderabad Warehouse');

INSERT INTO Product (SKU, ProductName, CategoryID, SupplierID)
VALUES
('P101', 'Laptop', 1, 1),
('P102', 'Mouse', 2, 2),
('P103', 'Keyboard', 2, 2),
('P104', 'Refrigerator', 3, 3),
('P105', 'Office Chair', 4, 1);

INSERT INTO Inventory (SKU, WarehouseID, Quantity, ReorderLevel)
VALUES
('P101', 1, 20, 5),
('P101', 2, 15, 5),
('P102', 1, 50, 10),
('P103', 2, 30, 8),
('P104', 3, 12, 4),
('P105', 1, 25, 6);

INSERT INTO Supplier (SupplierName, SupplierPhone)
VALUES
('Prime Distributors', '9876523456'),
('Tech World', '9876534567'),
('Metro Supplies', '9876545678'),
('Smart Traders', '9876556789'),
('City Wholesale', '9876567890'),
('Digital Products', '9876578901'),
('Universal Suppliers', '9876589012');

INSERT INTO Category (CategoryName)
VALUES
('Mobile Phones'),
('Computer Accessories'),
('Kitchen Appliances'),
('Office Supplies'),
('Lighting'),
('Personal Care');