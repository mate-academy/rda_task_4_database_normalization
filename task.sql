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
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
	ID INT,
    CountryID INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
	FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
    
INSERT INTO Products (ID,Name)
	VALUES (1, 'AwersomeProduct');
    
INSERT INTO Warehouses (ID,CountryID,WarehouseName,WarehouseAddress)
	VALUES (1, 1, 'Warehouse-1', 'City-1, Street-1');
INSERT INTO Warehouses (ID,CountryID,WarehouseName,WarehouseAddress)
	VALUES (2, 2, 'Warehouse-2', 'City-2, Street-2');
    
INSERT INTO ProductInventory (ID,ProductID,WarehouseAmount,WarehouseID)
	VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID,ProductID,WarehouseAmount,WarehouseID)
	VALUES (2, 1, 5, 2);
