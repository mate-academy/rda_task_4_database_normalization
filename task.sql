-- Create database and tables

DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Table 1: Countries (unchanged)
CREATE TABLE Countries (
    ID   INT          NOT NULL,
    Name VARCHAR(50)  NOT NULL,
    PRIMARY KEY (ID)
);

-- Table 2: Products (extracted from ProductInventory - 2NF/3NF: ProductName is not dependent on warehouse)
CREATE TABLE Products (
    ID   INT         NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

-- Table 3: Warehouses (extracted from ProductInventory - 3NF: warehouse info is not dependent on product)
CREATE TABLE Warehouses (
    ID        INT          NOT NULL,
    Name      VARCHAR(50)  NOT NULL,
    Address   VARCHAR(50)  NOT NULL,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Table 4: ProductInventory (normalized - only 4 columns: ID, ProductID, WarehouseAmount, WarehouseID)
CREATE TABLE ProductInventory (
    ID              INT NOT NULL,
    ProductID       INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    WarehouseID     INT NOT NULL,
    FOREIGN KEY (ProductID)   REFERENCES Products(ID)   ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID, Name) VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name) VALUES (2, 'Country2');

INSERT INTO Products (ID, Name) VALUES (1, 'AwersomeProduct');

INSERT INTO Warehouses (ID, Name, Address, CountryID)
    VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses (ID, Name, Address, CountryID)
    VALUES (2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
    VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
    VALUES (2, 1, 5, 2);
