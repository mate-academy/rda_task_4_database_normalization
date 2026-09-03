-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouse (
    ID INT AUTO_INCREMENT,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE CASCADE,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(100), 
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE CASCADE,
    WarehouseAmount INT,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (Name)
	VALUES ('Country1');
INSERT INTO Countries (Name)
	VALUES ('Country2');

INSERT INTO Warehouse (CountryID, WarehouseName, WarehouseAddress)
    VALUES(1, 'ATB', 'Ukraine, Dnipro, Naberegna Zavodska 93');
INSERT INTO Warehouse (CountryID, WarehouseName, WarehouseAddress)
    VALUES(2, 'Silpo', 'Latviya, Riga, Prospect Mega 17');

INSERT INTO Products (ProductName)
VALUES ('Bread');
INSERT INTO Products (ProductName)
VALUES ('Milk');
    
INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
	VALUES (1, 1, 100);
INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
	VALUES (2, 2, 500);