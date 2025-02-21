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
    ProductNameID INT, 
    FOREIGN KEY (ProductNameID) REFERENCES ProductName(ID) ON DELETE NO ACTION,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(ID) ON DELETE NO ACTION,
    StreetID INT,
    FOREIGN KEY (StreetID) REFERENCES Street(ID) ON DELETE NO ACTION,
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductName (
    ID INT AUTO_INCREMENT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouse (
    ID INT AUTO_INCREMENT,
    WarehouseName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE City ( 
    ID INT AUTO_INCREMENT,
    WarehouseCity VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Street ( 
    ID INT AUTO_INCREMENT,
    WarehouseStreet VARCHAR(50),
    PRIMARY KEY (ID)
);
-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO ProductName (ID,ProductName)
	VALUES (1, 'AwersomeProduct');

INSERT INTO Warehouse (ID,WarehouseName)
	VALUES (1, 'Warehouse-1');
INSERT INTO Warehouse (ID,WarehouseName)
	VALUES (2, 'Warehouse-2');

INSERT INTO City (ID,WarehouseCity)
	VALUES (1, 'City-1');
INSERT INTO City (ID,WarehouseCity)
	VALUES (2, 'City-2');

INSERT INTO Street (ID,WarehouseStreet)
	VALUES (1, 'Street-1');
INSERT INTO Street (ID,WarehouseStreet)
	VALUES (2, 'Street-2');
    
INSERT INTO ProductInventory (ID,ProductNameID,WarehouseAmount,WarehouseID,CityID,StreetID,CountryID)
	VALUES (1, 1, 2, 1, 1, 1, 1);
INSERT INTO ProductInventory (ID,ProductNameID,WarehouseAmount,WarehouseID,CityID, StreetID ,CountryID)
	VALUES (2, 1, 5, 2, 2, 2, 2);
