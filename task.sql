-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products(
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Warehouses(
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID)
    REFERENCES Countries(ID)
);

CREATE TABLE ProductInventory(
    ID INT PRIMARY KEY,
    WarehouseAmount INT,
    ProductID INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID)
    REFERENCES Warehouses(ID),
    FOREIGN KEY (ProductID)
    REFERENCES Products(ID)
);

-- Populate test data
INSERT INTO Products (ID, Name)
VALUES (1, 'AwersomeProduct');


INSERT INTO Countries (ID, Name)
VALUES (1, 'Country1');

INSERT INTO Countries (ID, Name)
VALUES (2, 'Country2');

INSERT INTO Warehouses(ID, Name, Address, CountryID)
VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1);

INSERT INTO Warehouses(ID, Name, Address, CountryID)
VALUES (2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
VALUES (1, 1, 1, 2);

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
VALUES (2, 1, 2, 5);