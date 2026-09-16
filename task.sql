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
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Amount INT,
    Address VARCHAR(50), 
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES ProductInventory(ID) ON DELETE SET NULL,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO ProductInventory (ID,ProductName,CountryID)
	VALUES (1, 'AwersomeProduct',1);

INSERT INTO Warehouses (Name,Amount,Address,ProductID)
	VALUES ('Warehouse-1',2,'City-1, Street-1',1);

INSERT INTO ProductInventory (ID,ProductName,CountryID)
	VALUES (2, 'AwersomeProduct',2);

INSERT INTO Warehouses (Name,Amount,Address,ProductID)
	VALUES ('Warehouse-2',5,'City-2, Street-2',2);