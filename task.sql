-- Create database and tables
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Product(
	ID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);
CREATE TABLE Warehouses(
	ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
    
);
CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT,
    WarehouseID INT,
    Amount INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION, 
    FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE NO ACTION
);

-- Populate test data

INSERT INTO Countries (ID, Name) VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name) VALUES (2, 'Country2');

INSERT INTO Product(ID, ProductName) VALUES (1, 'AwersomeProduct');

INSERT INTO Warehouses (ID, Name, Address, CountryID) VALUES (1, 'Warehouse-1', 'Street-1 City-1', 1);
INSERT INTO Warehouses (ID, Name, Address, CountryID) VALUES (2, 'Warehouse-2', 'Street-1 City-2', 2);

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, Amount)
VALUES 
    (1, 1, 1, 2),
    (2, 1, 2, 5);