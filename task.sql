-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);
CREATE TABLE Cities (
    ID INT AUTO_INCREMENT,
    NAME VARCHAR(100),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
CREATE TABLE Streets (
    ID INT AUTO_INCREMENT,
    NAME VARCHAR(100),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES Cities(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    NAME VARCHAR(100),
    StreetID INT,
    FOREIGN KEY (StreetID) REFERENCES Streets(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT, 
    ProductName VARCHAR(100),
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Cities (NAME,CountryID)
    VALUES ('City-1', 1);
INSERT INTO Cities (NAME,CountryID)
    VALUES ('City-2', 2);

INSERT Streets (NAME,CityID)
    VALUES ('Street-1', 1);
INSERT Streets (NAME,CityID)
    VALUES ('Street-2', 2);

INSERT INTO Warehouses (NAME,StreetID)
    VALUES ('Warehouse-1', 1);
INSERT INTO Warehouses (NAME,StreetID)
    VALUES ('Warehouse-2', 2);
    
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount,WarehouseID)
	VALUES (1, 'AwersomeProduct', 2, 1);
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount,WarehouseID)
	VALUES (2, 'AwersomeProduct', 5, 2);
