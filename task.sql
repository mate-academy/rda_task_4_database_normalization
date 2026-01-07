-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouse(
    ID INT AUTO_INCREMENT,
    WarehouseName VARCHAR(50),
    WarehouseAddressCity VARCHAR(50),
    WarehouseAddressStreet VARCHAR(50),
    CountriesID INT,
    FOREIGN KEY (CountriesID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Products(
    ID INT AUTO_INCREMENT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    WarehouseID INT,
    ProductID INT,
    WarehouseAmount INT,
	FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Warehouse (ID, WarehouseName, WarehouseAddressCity, WarehouseAddressStreet, CountriesID)
	VALUES (1, 'Warehouse-1', 'City-1', 'Street-1', 1);
INSERT INTO Warehouse (ID, WarehouseName, WarehouseAddressCity, WarehouseAddressStreet, CountriesID)
	VALUES (2, 'Warehouse-2', 'City-2', 'Street-2', 2);

INSERT INTO Products (ID, ProductName)
	VALUES (1, 'AwersomeProduct');
INSERT INTO Products (ID, ProductName)
	VALUES (2, 'AwersomeProduct');


INSERT INTO ProductInventory (ID, WarehouseID, ProductID, WarehouseAmount)
	VALUES (1, 1, 1, 2);
INSERT INTO ProductInventory (ID, WarehouseID, ProductID, WarehouseAmount)
	VALUES (2, 2, 2, 5);
