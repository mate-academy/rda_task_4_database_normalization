-- Create database and tables

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
    City VARCHAR(50),
    Address VARCHAR(50), 
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductName VARCHAR(50),
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    WarehouseAmount INT,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Warehouses (ID,WarehouseName,WarehouseCity,WarehouseAddress,CountryID)
	VALUES (1, 'Warehouse-1', 'City-1', 'Street-1', 1);
INSERT INTO Warehouses (ID,WarehouseName,WarehouseCity,WarehouseAddress,CountryID)
	VALUES (2, 'Warehouse-2', 'City-2', 'Street-2', 2);

INSERT INTO ProductInventory (ID,ProductName,WarehouseID,WarehouseAmount)
	VALUES (1, 'AwesomeProduct', 1, 2);
INSERT INTO ProductInventory (ID,ProductName,WarehouseID,WarehouseAmount)
	VALUES (2, 'AwesomeProduct', 2, 5);
