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
    CountryID INT,
    Name VARCHAR(50),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);


CREATE TABLE Streets (
    ID INT,
    CityID INT,
    Name VARCHAR(50),
    FOREIGN KEY (CityID) REFERENCES Cities(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);


CREATE TABLE Warehouse (
    ID INT,
    Name VARCHAR(50),
    StreetID INT,
    FOREIGN KEY (StreetID) REFERENCES Streets(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);


CREATE TABLE Products (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);


CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID, Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name)
	VALUES (2, 'Country2');


INSERT INTO Cities (ID, Name, CountryID)
	VALUES (1, 'City-1', 1);
INSERT INTO Cities (ID, Name, CountryID)
	VALUES (2, 'City-2', 2);


INSERT INTO Streets (ID, Name, CityID)
	VALUES (1, 'Street-1', 1);
INSERT INTO Streets (ID, Name, CityID)
	VALUES (2, 'Street-2', 2);


INSERT INTO Warehouse (ID, Name, StreetID)
	VALUES (1, 'Warehouse-1', 1);
INSERT INTO Warehouse (ID, Name, StreetID)
	VALUES (2, 'Warehouse-2', 2);


INSERT INTO Products (ID, Name)
	VALUES (1, 'AwersomeProduct');


INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
	VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID, ProductID,WarehouseAmount, WarehouseID)
	VALUES (2, 1, 5, 2);
