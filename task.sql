-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
  ID INT PRIMARY KEY,
  Name VARCHAR(50)
);

CREATE TABLE Warehouses (
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Address VARCHAR(50),
  CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT,
    FOREIGN KEY(ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    Amount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);

-- Populate test data
INSERT INTO Products(ID, Name) 
  VALUES(1, 'Product-1');
INSERT INTO Products(ID, Name) 
  VALUES(2, 'Product-2');

INSERT INTO Countries (ID, Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name)
	VALUES (2, 'Country2');


INSERT INTO Warehouses (ID, Name, Address, CountryID) 
  VaLUES (1, 'Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses (ID, Name, Address, CountryID) 
  VaLUES (2, 'Warehouse-2', 'City-2, Street-2', 2);
    
INSERT INTO ProductInventory (ID, ProductID, Amount, WarehouseID)
	VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID, ProductID, Amount, WarehouseID)
	VALUES (2, 2, 5, 2);
