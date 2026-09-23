-- Drop database if it already exists
DROP DATABASE IF EXISTS ShopDB;

-- Create database and tables
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (Name)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (Name),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT NOT NULL,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);

-- Populate test data

INSERT INTO Countries (Name)
    VALUES ('Country1');
INSERT INTO Countries (Name)
    VALUES ('Country2');

INSERT INTO Warehouses (Name, Address, CountryID)
    VALUES ('Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses (Name, Address, CountryID)
    VALUES ('Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (Name)
    VALUES ('AwesomeProduct');

INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
    VALUES (1, 1, 2);
INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
    VALUES (1, 2, 5);