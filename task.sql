-- Drop old database if exists
DROP DATABASE IF EXISTS ShopDB;

-- Create database and use it
CREATE DATABASE ShopDB;
USE ShopDB;

-- Countries table remains the same
CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- New Products table
CREATE TABLE Products (
    ID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL UNIQUE
);

-- New Warehouses table
CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    WarehouseName VARCHAR(50) NOT NULL,
    WarehouseAddress VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

-- ProductInventory table now only links Products and Warehouses with amount
CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE
);

-- Insert test data

INSERT INTO Countries (ID, Name) VALUES
(1, 'Country1'),
(2, 'Country2');

INSERT INTO Products (ID, ProductName) VALUES
(1, 'AwersomeProduct');

INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID) VALUES
(1, 'Warehouse-1', 'City-1, Street-1', 1),
(2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount) VALUES
(1, 1, 1, 2),
(2, 1, 2, 5);
