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

CREATE TABLE Warehouse (
    ID INT,
	ProductID INT,
	FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE NO ACTION,
	WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
	PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    WarehouseID INT,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    WarehouseAmount INT,
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
   
INSERT INTO Product (ID, ProductName)
	VALUES (1, 'AwesomeProduct');    

INSERT INTO Warehouse (ID, ProductID, WarehouseName, WarehouseAddress)
	VALUES (1, 1, 'Warehouse-1', 'City-1, Street-1');
INSERT INTO Warehouse (ID, ProductID, WarehouseName, WarehouseAddress)
	VALUES (2, 1, 'Warehouse-2', 'City-2, Street-2');

INSERT INTO ProductInventory (ID, WarehouseID, WarehouseAmount, CountryID)
	VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID, WarehouseID, WarehouseAmount, CountryID)
	VALUES (2, 2, 3, 2);
