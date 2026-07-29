-- Create database and tables
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE WarehouseAmount(
    ID INT,
    ProductAmount INT,
    PRIMARY KEY (ID)
);

CREATE TABLE WarehouseInfo(
    ID INT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    WarehouseAmountID INT,
    FOREIGN KEY (WarehouseAmountID) REFERENCES WarehouseAmount(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductName VARCHAR(50),
    ProductAmountID INT,
    FOREIGN KEY (ProductAmountID) REFERENCES WarehouseAmount(ID) ON DELETE NO ACTION,
    WarehouseInfoID INT,
    FOREIGN KEY (WarehouseInfoID) REFERENCES WarehouseInfo(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO WarehouseAmount (ID,ProductAmount)
	VALUES (1, 2),
        (2,5);

INSERT INTO WarehouseInfo (ID,Name,Address,CountryID,WarehouseAmountID) 
    VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1, 1),
    (2, 'Warehouse-2', 'City-2, Street-2', 2, 2);
    
INSERT INTO ProductInventory (ID,ProductName,ProductAmountID,WarehouseInfoID)
	VALUES (1, 'AwersomeProduct1', 1, 1);
INSERT INTO ProductInventory (ID,ProductName,ProductAmountID,WarehouseInfoID)
	VALUES (2, 'AwersomeProduct2', 2, 2);
