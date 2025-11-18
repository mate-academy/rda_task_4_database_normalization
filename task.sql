-- Create database and tables
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Countries table
CREATE TABLE Countries (
    ID   INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

-- Products table
CREATE TABLE Products (
    ID   INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

-- Warehouses table
CREATE TABLE Warehouses (
    ID        INT,
    Name      VARCHAR(50),
    Address   VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- ProductInventory table
CREATE TABLE ProductInventory (
    ID              INT,
    ProductID       INT,
    WarehouseAmount INT,
    WarehouseID     INT,
    FOREIGN KEY (ProductID)   REFERENCES Products(ID)    ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- =========================
-- Populate test data
-- =========================

-- Countries
INSERT INTO Countries (ID, Name)
VALUES (1, 'Country1'),
       (2, 'Country2');

-- Products
INSERT INTO Products (ID, Name)
VALUES (1, 'AwesomeProduct');

-- Warehouses
INSERT INTO Warehouses (ID, Name, Address, CountryID)
VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1),
       (2, 'Warehouse-2', 'City-2, Street-2', 2);

-- Product inventory
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
VALUES (1, 1, 2, 1),
       (2, 1, 5, 2);
