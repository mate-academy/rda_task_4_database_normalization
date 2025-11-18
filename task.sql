-- Create database and tables
CREATE DATABASE ShopDB;
USE ShopDB;

-- Countries table
CREATE TABLE Countries (
    ID   INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

-- New table: Products
CREATE TABLE Products (
    ID   INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

-- New table: Warehouses
CREATE TABLE Warehouses (
    ID        INT,
    Name      VARCHAR(50),
    Address   VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- ProductInventory
CREATE TABLE ProductInventory (
    ID              INT,
    ProductID       INT,
    WarehouseAmount INT,
    WarehouseID     INT,
    FOREIGN KEY (ProductID)  REFERENCES Products(ID)   ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

-- Countries
INSERT INTO Count

