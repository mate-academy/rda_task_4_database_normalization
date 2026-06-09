-- Create database and tables (normalized to 3NF)

DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE
);

-- Populate test data adjusted for normalized schema

INSERT INTO Countries (ID,Name) VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name) VALUES (2, 'Country2');

INSERT INTO Products (ID,Name) VALUES (1, 'AwersomeProduct');

INSERT INTO Warehouses (ID,Name,Address,CountryID)
    VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses (ID,Name,Address,CountryID)
    VALUES (2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO ProductInventory (ID,ProductID,WarehouseID,WarehouseAmount)
    VALUES (1, 1, 1, 2);
INSERT INTO ProductInventory (ID,ProductID,WarehouseID,WarehouseAmount)
    VALUES (2, 1, 2, 5);
