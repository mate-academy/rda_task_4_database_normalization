-- Create database and tables

DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT,
    Name VARCHAR(50),
    Address VARCHAR(100),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
CREATE TABLE Products (
    ID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE SET NULL,
    PRIMARY KEY (ID)
);

-- Populate test data
INSERT INTO Products(ID, ProductName)
    VALUES (1, 'AwesomeProduct');
INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
INSERT INTO Warehouses(ID, Name, Address, CountryID)
    VALUES (1,'Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses(ID, Name, Address, CountryID)
    VALUES (2, 'Warehouse-2', 'City-2, Street-2', 2);
INSERT INTO ProductInventory(ID,ProductID,WarehouseAmount,WarehouseID)
	VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory(ID,ProductID,WarehouseAmount,WarehouseID)
	VALUES (2, 1, 5,2);
