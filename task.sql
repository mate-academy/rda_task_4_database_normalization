-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Product (
    ID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY(CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory(
    ID INT,
    ProductID INT,
    WarehouseID INT,
    Amount INT,
    FOREIGN KEY(ProductID) REFERENCES Product(ID) ON DELETE NO ACTION,
    FOREIGN KEY(WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);


-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Product (ID,ProductName)
	VALUES (1, 'Product1');
INSERT INTO Product (ID,ProductName)
	VALUES (2, 'Product2');
    
INSERT INTO Warehouses (ID,Name,Address,CountryID)
	VALUES (1, 'Warehouses1', 'address1', 1);
INSERT INTO Warehouses (ID,Name,Address,CountryID)
	VALUES (2, 'Warehouses2', 'address2', 2);

INSERT INTO ProductInventory (ID,ProductID,WarehouseID,Amount)
	VALUES (1, 1, 1, 2);
INSERT INTO ProductInventory (ID,ProductID,WarehouseID,Amount)
	VALUES (2, 2, 2, 5);
