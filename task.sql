-- Create database and tables
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouse (
    ID INT,
    Address VARCHAR(50),
    Name VARCHAR(50),
    ProductID VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES ProductInventory(ID) ON DELETE NO ACTION,
    Amount INT,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
    
INSERT INTO ProductInventory (ID,ProductName)
	VALUES (1, 'AwersomeProduct');
INSERT INTO Warehouse (ID, Amount, Name, ProductID, Address, CountryID)
    VALUES (1, 2, 'Warehouse-1', 1, 'City-1, Street-1', 1 );

INSERT INTO ProductInventory (ID,ProductName)
	VALUES (2, 'AwersomeProduct');
INSERT INTO Warehouse (ID, Amount, Name, ProductID, Address, CountryID)
    VALUES (2, 5, 'Warehouse-2', 2, 'City-2, Street-2', 2 );
