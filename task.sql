-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ProductID) REFERENCES Products (ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses (ID) ON DELETE CASCADE 
);


-- Populate test data
-- Countries
INSERT INTO Countries (Name)
	VALUES ('Country1');
INSERT INTO Countries (Name)
	VALUES ('Country2');

-- Products
INSERT INTO Products (Name)
    VALUES ('AwersomeProduct');

-- Warehouse
INSERT INTO Warehouses (Name, Address, CountryID)
    VALUES ('Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses (Name, Address, CountryID)
    VALUES ('Warehouse-2', 'City-2, Street-2', 2);

-- ProductInventory
INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
    VALUES(1,1,2);
INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
    VALUES(1,2,5);
