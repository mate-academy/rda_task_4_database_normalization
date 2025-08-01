-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Addresses(
ID INT,
Street VARCHAR(50),
City VARCHAR(50),
CountryID INT,
FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
PRIMARY KEY (ID)
);

CREATE TABLE Warehouses(
	ID INT,
	WarehouseName VARCHAR(50),
    WarehouseAmount INT,
	PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductName VARCHAR(50),
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    AddressID INT,
	FOREIGN KEY (AddressID) REFERENCES Addresses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Addresses (ID,Street,City,CountryID)
	VALUES (1, 'Street-1', 'City-1', 1);
INSERT INTO Addresses (ID,Street,City,CountryID)
	VALUES (2, 'Street-2', 'City-2', 2);

INSERT INTO Warehouses (ID,WarehouseName,WarehouseAmount)
	VALUES (1, 'Warehouse-1', 2);
INSERT INTO Warehouses (ID,WarehouseName,WarehouseAmount)
	VALUES (2, 'Warehouse-2', 5);
    
INSERT INTO ProductInventory (ID,ProductName,WarehouseID,AddressID)
	VALUES (1, 'AwersomeProduct', 1, 1);
INSERT INTO ProductInventory (ID,ProductName,WarehouseID,AddressID)
	VALUES (2, 'AwersomeProduct', 2, 2);
