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
    WarehouseAmount INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Product (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseID INT,
    Amount INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Product(ID,Name)
	VALUES (1, 'AwersomeProduct');
INSERT INTO Product(ID,Name)
	VALUES (2, 'AwersomeProduct');

INSERT INTO Warehouse (ID, WarehouseAmount, WarehouseName, WarehouseAddress, CountryID)
VALUES (1, 2, 'Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouse (ID, WarehouseAmount, WarehouseName, WarehouseAddress, CountryID)
VALUES (2, 5, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, Amount)
    VALUES (1, 1, 1, 10);
INSERT INTO ProductInventory (ID, ProductID, WarehouseID, Amount)
    VALUES (2, 1, 1, 20);
