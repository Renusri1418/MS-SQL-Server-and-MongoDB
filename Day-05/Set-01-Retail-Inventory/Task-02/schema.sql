CREATE DATABASE RetailInventoryDB;
GO

USE RetailInventoryDB;
GO 

CREATE TABLE Supplier(
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    SupplierPhone VARCHAR(15) NOT NULL,
);
GO
ALTER TABLE Supplier
ADD CONSTRAINT UQ_Supplier_Name
UNIQUE (SupplierName);
GO

CREATE TABLE Category(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE Warehouse
(
    WarehouseID INT IDENTITY(1,1) PRIMARY KEY,
    WarehouseName VARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE Product(
    SKU VARCHAR(20) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    SupplierID INT NOT NULL,
    CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    CONSTRAINT FK_Product_Supplier FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);
GO

CREATE TABLE Inventory
(
    SKU VARCHAR(20) NOT NULL,
    WarehouseID INT NOT NULL,

    Quantity INT NOT NULL DEFAULT 0,
    ReorderLevel INT NOT NULL DEFAULT 5,

    CONSTRAINT PK_Inventory
        PRIMARY KEY (SKU, WarehouseID),

    CONSTRAINT FK_Inventory_Product
        FOREIGN KEY (SKU)
        REFERENCES Product(SKU),

    CONSTRAINT FK_Inventory_Warehouse
        FOREIGN KEY (WarehouseID)
        REFERENCES Warehouse(WarehouseID),

    CONSTRAINT CK_Inventory_Quantity
        CHECK (Quantity >= 0),

    CONSTRAINT CK_Inventory_ReorderLevel
        CHECK (ReorderLevel >= 0)
);
GO

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
ORDER BY TABLE_NAME;
