DROP DATABASE IF EXISTS ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE WareHouses (
    ID INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
	ID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES WareHouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

INSERT INTO Countries (ID, Name)
	VALUES (1, 'Country1'),
	       (2, 'Country2');
    
INSERT INTO WareHouses (ID, WarehouseName, WarehouseAddress, CountryID)
	VALUES (1, 'Main Warehouse', 'Address 1', 1),
           (2, 'Backup Warehouse', 'Address 2', 2);
    
INSERT INTO Products (ID, ProductName)
	VALUES (1, 'AwersomeProduct'),
		   (2, 'AwersomeProduct');
    
INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
	VALUES (1, 1, 1, 100),
	       (2, 2, 2, 200);
