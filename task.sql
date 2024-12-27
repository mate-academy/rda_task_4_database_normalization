-- Drop the old database
DROP DATABASE ShopDB;

-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Cities (
		ID INT AUTO_INCREMENT,
		Name VARCHAR(50),
		CountryID INT,
		FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE CASCADE,
		PRIMARY KEY (ID)
);

CREATE TABLE Addresses (
		ID INT AUTO_INCREMENT,
		StreetName VARCHAR(100),
		CityID INT,
		FOREIGN KEY (CityID) REFERENCES Cities(ID) ON DELETE CASCADE,
		PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
		ID INT AUTO_INCREMENT,
		Name VARCHAR(50),
		AddressID INT,
		FOREIGN KEY (AddressID) REFERENCES Addresses(ID) ON DELETE CASCADE,
		PRIMARY KEY (ID)
)

CREATE TABLE ProductInventory (
		ID INT AUTO_INCREMENT,
		ProductName VARCHAR(50),
		WarehouseAmount INT,
		WarehouseID INT,
		FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE,
		PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (Name)
	VALUES ('Country1');
INSERT INTO Countries (Name)
	VALUES ('Country2');

INSERT INTO Cities(Name, CountryID)
	VALUES ('City-1', 1)

INSERT INTO Cities(Name, CountryID)
	VALUES ('City-2', 2)

INSERT INTO Addresses(StreetName, CityID)
	VALUES ('Street-1', 1)

INSERT INTO Addresses(StreetName, CityID)
	VALUES ('Street-2', 2)

INSERT INTO Warehouses (Name, AddressID)
	VALUES ('Warehouse-1', 1)
INSERT INTO ProductInventory (ProductName, WarehouseAmount, WarehouseID)
	VALUES ('AwersomeProduct', 2, 1);
INSERT INTO ProductInventory (ProductName, WarehouseAmount, WarehouseID)
	VALUES ('AwersomeProduct', 5, 2);
