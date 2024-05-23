-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE `Products List` (				
    ID INT,
    `Product Name` VARCHAR(50),
    
	PRIMARY KEY (ID)
);

CREATE TABLE Countries (
    ID INT,
    Country VARCHAR(50),
    
	PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT,
	Warehouse VARCHAR(50),
    CountryID INT,
    Address VARCHAR(50),
    
	PRIMARY KEY (ID),
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseID INT,
    Amount INT,
    
	PRIMARY KEY (ID),
	FOREIGN KEY (ProductID) REFERENCES `Products List`(ID) ON DELETE NO ACTION,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION	
);

-- Insert data

INSERT INTO `Products List` (ID,`Product Name`)
	VALUES (1, 'AwersomeProduct');

INSERT INTO Countries (ID,Country)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Country)
	VALUES (2, 'Country2');
    
INSERT INTO Warehouses (ID,Warehouse,CountryID,Address)
	VALUES (1, 'Warehouse-1', 1, 'City-1, Street-1');
INSERT INTO Warehouses (ID,Warehouse,CountryID,Address)
	VALUES (2, 'Warehouse-2', 2, 'City-2, Street-2');

INSERT INTO ProductInventory (ID,ProductID,WarehouseID,Amount)
	VALUES (1, 1, 1, 2);
INSERT INTO ProductInventory (ID,ProductID,WarehouseID,Amount)
	VALUES (2, 1, 2, 5);
