-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID)
	    ON DELETE NO ACTION
	    ON UPDATE CASCADE
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(50),
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductId INT,
    WarehouseId INT,
    WarehouseAmount INT,
    FOREIGN KEY (WarehouseId) REFERENCES Warehouses(ID)
    	ON DELETE NO ACTION
	    ON UPDATE CASCADE
	FOREIGN KEY (ProductId) REFERENCES Products(ID)
    	ON DELETE NO ACTION
	    ON UPDATE CASCADE
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Warehouses (WarehouseName,WarehouseAddress,CountryID)
    VALUES ('Warehouse-1', 'City-1, Street-1',1), ('Warehouse-2', 'City-2, Street-2',2);

INSERT INTO Products (ID,ProductName)
    VALUES (1, 'AwersomeProduct1'), (2, 'AwersomeProduct2');

INSERT INTO ProductInventory (ProductId,WarehouseId,WarehouseAmount)
	VALUES (1, 1, 2);
INSERT INTO ProductInventory (ProductId,WarehouseId,WarehouseAmount)
	VALUES (2, 2, 5);
