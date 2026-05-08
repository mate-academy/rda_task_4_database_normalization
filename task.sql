-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Cities (
	ID INT,
    Name VARCHAR (50),
    CountryID INT,
	FOREIGN KEY (CountryID)
		REFERENCES Countries (ID)
		ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Streets (
	ID INT,
    Name VARCHAR (50),
    CityID INT,
    FOREIGN KEY (CityID)
		REFERENCES Cities (ID)
		ON DELETE NO ACTION,
	PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
	ID INT,
    WarehouseName VARCHAR(50),
    StreetID INT,
    FOREIGN KEY (StreetID)
		REFERENCES Streets (ID)
        ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
	ProductID INT,
    FOREIGN KEY  (ProductID)
		REFERENCES Products (ID)
        ON DELETE NO ACTION,
    WarehouseID INT,
	FOREIGN KEY  (WarehouseID)
		REFERENCES Warehouses (ID)
        ON DELETE NO ACTION,
    Amount INT,
    PRIMARY KEY (ProductID, WarehouseID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');



INSERT INTO Products (ID, ProductName)
	VALUES (1, 'AwersomeProduct');
INSERT INTO Cities (ID, Name, CountryID)
	VALUES (1, 'City-1', 1);
INSERT INTO Streets (ID, Name, CityID)
	VALUES (1, 'Street-1', 1);
INSERT INTO Warehouses (ID, WarehouseName, StreetID)
	VALUES (1, 'Warehouse-1', 1);
INSERT INTO ProductInventory (ProductID, WarehouseID, Amount)
	VALUES (1, 1, 2);



INSERT INTO Products (ID, ProductName)
	VALUES (2, 'AwersomeProduct');
INSERT INTO Cities (ID, Name, CountryID)
	VALUES (2, 'City-2', 2);
INSERT INTO Streets (ID, Name, CityID)
	VALUES (2, 'Street-2', 2);
INSERT INTO Warehouses (ID, WarehouseName, StreetID)
	VALUES (2, 'Warehouse-2', 2);
INSERT INTO ProductInventory (ProductID, WarehouseID, Amount)
	VALUES (2, 2, 5);
