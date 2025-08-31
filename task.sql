-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT,
    ProductName VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Cities (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Addresses (
    ID INT,
    CountryID INT,
    CityID INT,
    StreetName VARCHAR(50),
    PRIMARY KEY (ID),
    FOREIGN KEY (CityID) REFERENCES Cities (ID) ON DELETE NO ACTION,
    FOREIGN KEY (CountryID) REFERENCES Countries (ID) ON DELETE NO ACTION
);

CREATE TABLE Warehouses (
    ID INT,
    Name VARCHAR(50),
    AddressID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (AddressID) REFERENCES Addresses (ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses (ID) ON DELETE NO ACTION,
    FOREIGN KEY (ProductID) REFERENCES Products (ID) ON DELETE NO ACTION, 
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Cities (ID,Name)
    VALUES (1, 'City-1');
INSERT INTO Cities (ID,Name)
    VALUES (2, 'City-2');

INSERT INTO Addresses (ID, CityID, CountryID, StreetName)
    VALUES (1, 1, 1, 'Street-1');
INSERT INTO Addresses (ID, CityID, CountryID, StreetName)
    VALUES (2, 2, 2, 'Street-2');

INSERT INTO Warehouses (ID, Name, AddressID)
    VALUES (1, 'Warehouse-1', 1);
INSERT INTO Warehouses (ID, Name, AddressID)
    VALUES (2, 'Warehouse-2', 2);

INSERT INTO Products (ID, ProductName)
    VALUES (1, 'AwersomeProduct');

INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
    VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
    VALUES (2, 1, 5, 2);