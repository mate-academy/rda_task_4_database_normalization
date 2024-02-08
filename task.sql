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
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50), 
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
CREATE TABLE Product (
    ID INT,
    ProductName VARCHAR(100),
    PRIMARY KEY (ID)
);
CREATE TABLE ProductInventory(
    ID INT,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE NO ACTION,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
    
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount,WarehouseName,WarehouseAddress,CountryID)
	VALUES (1, 1, 2, 1, 1, 1, 1);
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount,WarehouseName,WarehouseAddress,CountryID)
	VALUES (2, 1, 5, 2, 2, 2, 2);
