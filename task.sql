DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Products (
    ID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE
);

INSERT INTO Countries (ID, Name) VALUES
(1, 'Country1'),
(2, 'Country2');

INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID) VALUES
(1, 'Warehouse-1', 'City-1, Street-1', 1),
(2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (ID, ProductName) VALUES
(1, 'AwersomeProduct');

INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID) VALUES
(1, 1, 2, 1),
(2, 1, 5, 2);
