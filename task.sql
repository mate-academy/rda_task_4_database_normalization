DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Countries
CREATE TABLE Countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(50) NOT NULL
);

-- Warehouses
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

-- ProductInventory (normalized: just IDs + quantity)
CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    WarehouseID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID) ON DELETE CASCADE
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

-- Product Inventory
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID) VALUES
(1, 1, 2, 1),  -- 2 products in Warehouse-1
(2, 1, 5, 2);  -- 5 products in Warehouse-2
