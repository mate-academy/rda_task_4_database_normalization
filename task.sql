-- Drop the existing database if it exists
DROP DATABASE IF EXISTS ShopDB;

-- Create a new database
CREATE DATABASE ShopDB;

-- Use the new database
USE ShopDB;

-- Create the normalized tables
-- Table for countries (already normalized)
CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

-- Normalized Products table to hold product details
CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Normalized Warehouses table to remove transitive dependencies
-- This table stores all warehouse information in one place
CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE SET NULL
);

-- Normalized ProductInventories table to link products and warehouses
-- This is a join table that resolves a many-to-many relationship and stores the quantity
CREATE TABLE ProductInventories (
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE
);

-- Populate the normalized tables with test data
-- Insert countries
INSERT INTO Countries (Name) VALUES
('Ukraine'),
('USA');

-- Insert products
INSERT INTO Products (Name) VALUES
('AwesomeProduct'),
('CoolProduct');

-- Insert warehouses
INSERT INTO Warehouses (Name, Address, CountryID) VALUES
('Warehouse-1', 'City-1, Street-1', 1),
('Warehouse-2', 'City-2, Street-2', 2);

-- Insert product inventories
INSERT INTO ProductInventories (ProductID, WarehouseID, WarehouseAmount) VALUES
(1, 1, 2),
(1, 2, 5),
(2, 1, 3),
(2, 2, 7);