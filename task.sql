-- Drop database if exists
DROP DATABASE IF EXISTS ShopDB;

-- Create database
CREATE DATABASE ShopDB;
USE ShopDB;

-- =====================
-- Countries
-- =====================
CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- =====================
-- Products
-- =====================
CREATE TABLE Products (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- =====================
-- Warehouses
-- =====================
CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

-- =====================
-- ProductInventory (Product ↔ Warehouse)
-- =====================
CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- =====================
-- Populate test data
-- =====================

-- Countries
INSERT INTO Countries (ID, Name)
VALUES 
    (1, 'Country1'),
    (2, 'Country2');

-- Products
INSERT INTO Products (ID, Name)
VALUES 
    (1, 'AwersomeProduct');

-- Warehouses
INSERT INTO Warehouses (ID, Name, Address, CountryID)
VALUES
    (1, 'Warehouse-1', 'City-1, Street-1', 1),
    (2, 'Warehouse-2', 'City-2, Street-2', 2);

-- ProductInventory
INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 5);
