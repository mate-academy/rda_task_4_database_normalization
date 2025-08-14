-- Create database and tables

DROP DATABASE ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

-- Base reference: Countries
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

-- New reference: Products (distinct products)
CREATE TABLE Products (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

-- New reference: Warehouses (distinct warehouses, linked to a country)
CREATE TABLE Warehouses (
    ID INT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Junction: Product inventory per warehouse
CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

-- Countries
INSERT INTO Countries (ID, Name)
    VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name)
    VALUES (2, 'Country2');

-- Products
INSERT INTO Products (ID, Name)
    VALUES (1, 'AwersomeProduct');

-- Warehouses
INSERT INTO Warehouses (ID, Name, Address, CountryID)
    VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses (ID, Name, Address, CountryID)
    VALUES (2, 'Warehouse-2', 'City-2, Street-2', 2);

-- Product inventory per warehouse
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
    VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
    VALUES (2, 1, 5, 2);
