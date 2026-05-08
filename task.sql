-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Product (
	ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
	ID INT,
    Name VARCHAR(50),
    CityName VARCHAR(50),
    StreetName VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    Amount INT,
    WarehouseID INT,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
	ProductID INT,
	FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Product (ID, Name)
	VALUES (1, 'AwersomeProduct');
INSERT INTO Warehouses (ID, Name, CityName, StreetName, CountryID)
	VALUES (1, 'Warehouse-1', 'City-1', 'Street-1', 1);
INSERT INTO ProductInventory (ID, Amount, WarehouseID, ProductID)
	VALUES (1, 2, 1, 1);

INSERT INTO Countries (ID, Name)
	VALUES (2, 'Country2');
INSERT INTO Product (ID, Name)
	VALUES (2, 'AwersomeProduct');
INSERT INTO Warehouses (ID, Name, CityName, StreetName, CountryID)
	VALUES (2, 'Warehouse-2', 'City-2', 'Street-2', 2);
INSERT INTO ProductInventory (ID, Amount, WarehouseID, ProductID)
	VALUES (2, 5, 2, 2);
