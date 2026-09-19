CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(50), 
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

-- Countries
INSERT INTO Countries (ID,Name)
VALUES 
    (1, 'Country1'),
	(2, 'Country2');

-- first warehouse
INSERT INTO Warehouses (Name, Address, CountryID)
VALUES ('Warehouse-1', 'City-1, Street-1', 1);

SET @warehouse1 = LAST_INSERT_ID();

INSERT INTO Products (ProductName)
VALUES ('AwersomeProduct');

SET @product1 = LAST_INSERT_ID();

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
VALUES (1, @product1, @warehouse1, 2);

-- second warehouse
INSERT INTO Warehouses (Name, Address, CountryID)
VALUES ('Warehouse-2', 'City-2, Street-2', 2);

SET @warehouse2 = LAST_INSERT_ID();

INSERT INTO Products (ProductName)
VALUES ('AwersomeProduct');

SET @product2 = LAST_INSERT_ID();

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
VALUES (2, @product2, @warehouse2, 5);
