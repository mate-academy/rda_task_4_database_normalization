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
    ProductName VARCHAR(50),
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouse (
    ID INT,
    WarehouseAmount INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
)

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
    
INSERT INTO ProductInventory (ID,ProductName, WarehouseID)
	VALUES (1, 'AwersomeProduct', 2,1);
INSERT INTO ProductInventory (ID,ProductName, WarehouseID)
	VALUES (2, 'AwersomeProduct', 5, 2, 2);


INSERT INTO Warehouse (ID,WarehouseAmount,WarehouseName, WarehouseAddress, CountryID)
    VALUES (1, 1, 's', 'ss',1);
INSERT INTO Warehouse (ID,WarehouseAmount,WarehouseName, WarehouseAddress, CountryID)
        VALUES (2, 1, 's', 'ss',2);