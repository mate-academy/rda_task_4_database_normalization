-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Products (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Addresses (
    ID INT PRIMARY KEY,
    Country VARCHAR(50),
    City VARCHAR(50),
    Street VARCHAR(50)
);

CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    AddressID INT,
    FOREIGN KEY (AddressID) REFERENCES Addresses(ID) ON DELETE SET NULL
);

CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE SET NULL,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE SET NULL
);

-- Populate test data

INSERT INTO Products(ID, Name) VALUE (1, 'AwesomeProduct');

INSERT INTO Addresses (ID, City, Street, Country)
    VALUES (1, 'City-1', 'Street-1', 'Country1'),
           (2, 'City-2', 'Street-2', 'Country2');

INSERT INTO Warehouses(ID, Name, AddressID)
    VALUES (1,'Warehouse-1', 1),
           (2,'Warehouse-2', 2);
    
INSERT INTO ProductInventory (ID, WarehouseAmount, ProductID,WarehouseID)
	VALUES (1, 2, 1, 1),
	       (2, 5, 1, 2);