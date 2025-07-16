-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT,
    Amount INT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductName VARCHAR(50),
    WarehouseID INT,
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);


INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
INSERT INTO Warehouses (ID, Amount, Name, Address)
    VALUES (1, 2, 'Warehouse-1', 'City-1, Street-1'),
           (2, 5, 'Warehouse-2', 'City-2, Street-2');
    
INSERT INTO ProductInventory (ID,ProductName,WarehouseID,CountryID)
	VALUES (1, 'AwersomeProduct', 1,1);
INSERT INTO ProductInventory (ID,ProductName,WarehouseID,CountryID)
	VALUES (2, 'AwersomeProduct', 2,2);

