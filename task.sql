-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE WareHouse (
    ID INT,
    WarehouseName VARCHAR(50),
    WareHouseCity VARCHAR(50),
    WarehouseStreet VARCHAR(50),
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY(ID)
);

CREATE TABLE Products (
    ID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY(ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WareHouseAmount INT,
    WareHouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WareHouseID) REFERENCES WareHouse(ID) ON DELETE NO ACTION, 
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO WareHouse (ID,WarehouseName,WareHouseCity,WarehouseStreet,CountryID)
    VALUES (1,'Warehouse-1','City-1','Street-1',1);
INSERT INTO WareHouse (ID,WarehouseName,WareHouseCity,WarehouseStreet,CountryID)
    VALUES (2,'Warehouse-2','City-2','Street-2',2);

INSERT INTO Products(ID,ProductName)
    VALUES (1, 'AwersomeProduct');

INSERT INTO ProductInventory (ID,ProductID,WareHouseAmount,WareHouseID)
	VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID,ProductID,WareHouseAmount,WareHouseID)
	VALUES (2, 1, 5, 2);