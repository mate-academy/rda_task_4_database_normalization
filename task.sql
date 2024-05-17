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
    Address VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID),
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Products (
    ID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
	FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2'), (1, 'Country1');

INSERT INTO Warehouses (ID, Name, Address, CountryID)
    VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1), (2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (ID,ProductName)
	VALUES (1, 'AwesomeProduct'), (2, 'AwesomeProduct');

INSERT INTO ProductInventory (ID,ProductID,WarehouseID,WarehouseAmount)
	VALUES (1, 1, 1, 2), (2, 2, 2, 5);
