-- Create database and tables
drop database if exists ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT auto_increment not null,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT auto_increment not null,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT auto_increment not null,
    WarehouseName VARCHAR(50),
	WarehouseAddress VARCHAR(50),
    CountryID INT not null,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT auto_increment not null,
    ProductID INT not null,
    WarehouseAmount INT,
    WarehouseID INT not null,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
-- Populate test data


start transaction;
-- Countries
INSERT INTO Countries (Name)
	VALUES ('Country1');
INSERT INTO Countries (Name)
	VALUES ('Country2');
    
-- Products
INSERT INTO Products (ProductName)
	VALUES ('AwersomeProduct');

-- Warehouses
INSERT into Warehouses (WarehouseName,WarehouseAddress,CountryID)
	values ('Warehouse-1', 'City-1, Street-1',1);
INSERT into Warehouses (WarehouseName,WarehouseAddress,CountryID)
	values ('Warehouse-2','City-2, Street-2',  2);
    
-- Product inventory
INSERT INTO ProductInventory (ProductID,WarehouseAmount,WarehouseID)
	VALUES (1, 2, 1);
INSERT INTO ProductInventory (ProductID,WarehouseAmount,WarehouseID)
	VALUES (1, 5, 2);
commit;