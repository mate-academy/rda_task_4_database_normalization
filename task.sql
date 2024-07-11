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

CREATE TABLE Warehouse (
	ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    Address VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT,
    WarehouseID INT,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    WarehouseAmount INT,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
INSERT INTO Products (ID,Name)
	VALUES (1, 'AwersomeProduct');
INSERT INTO Warehouse (ID,Name,CountryID,Address)
	VALUES (1, 'Warehouse-1', 1, 'City-1, Street-1');
INSERT INTO Warehouse (ID,Name,CountryID,Address)
	VALUES (2, 'Warehouse-2', 2, 'City-2, Street-2');
    
INSERT INTO ProductInventory (ID,ProductID,WarehouseID,WarehouseAmount)
	VALUES (1, 1, 1, 2);
INSERT INTO ProductInventory (ID,ProductID,WarehouseID,WarehouseAmount)
	VALUES (2, 1, 2, 5);
