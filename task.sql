-- Drop old database if needed
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Countries
CREATE TABLE Countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(50) NOT NULL
);

-- Warehouses (linked to country)
CREATE TABLE Warehouses (
    WarehouseID INT PRIMARY KEY,
    WarehouseName VARCHAR(50) NOT NULL,
    WarehouseAddress VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID) ON DELETE CASCADE
);

-- Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL
);

-- Inventory (link table: warehouse ↔ product)
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    WarehouseID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Countries
INSERT INTO Countries (CountryID, CountryName) VALUES
(1, 'Country1'),
(2, 'Country2');

-- Warehouses
INSERT INTO Warehouses (WarehouseID, WarehouseName, WarehouseAddress, CountryID) VALUES
(1, 'Warehouse-1', 'City-1, Street-1', 1),
(2, 'Warehouse-2', 'City-2, Street-2', 2);

-- Products
INSERT INTO Products (ProductID, ProductName) VALUES
(1, 'AwersomeProduct');

-- Inventory (Product in Warehouse)
INSERT INTO Inventory (InventoryID, WarehouseID, ProductID, Quantity) VALUES
(1, 1, 1, 2),  -- 2 products in Warehouse-1
(2, 2, 1, 5);  -- 5 products in Warehouse-2
