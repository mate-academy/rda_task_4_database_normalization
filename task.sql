-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouse (
    ID INT,
    Name VARCHAR(50),
    CountryID INT,
    Address VARCHAR(50),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductName VARCHAR(50),
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Warehouse (ID, Name, CountryID, Address)
    VALUES (1, 'Warehouse-1', 1, 'City-1, Street-1');
INSERT INTO Warehouse (ID, Name, CountryID, Address)
    VALUES (2, 'Warehouse-2', 2, 'City-2, Street-2');
    
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount,WarehouseID)
	VALUES (1, 'AwersomeProduct', 2, 1);
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount,WarehouseID)
	VALUES (2, 'AwersomeProduct', 5, 2);
