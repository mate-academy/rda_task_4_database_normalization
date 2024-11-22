-- Drop and recreate the database
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Create Countries table
CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

-- Create Products table
CREATE TABLE Products (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

-- Create Warehouses table
CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

-- Create ProductInventory table
CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE
);

-- Populate test data

-- Insert countries
INSERT INTO Countries (ID, Name) VALUES
    (1, 'Country1'),
    (2, 'Country2');

-- Insert products
INSERT INTO Products (ID, Name) VALUES
    (1, 'AwersomeProduct');

-- Insert warehouses
INSERT INTO Warehouses (ID, Name, Address, CountryID) VALUES
    (1, 'Warehouse-1', 'City-1, Street-1', 1),
    (2, 'Warehouse-2', 'City-2, Street-2', 2);

-- Insert product inventory
INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount) VALUES
    (1, 1, 2),
    (1, 2, 5);
