CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(100),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);  

CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
    ON DELETE NO ACTION
);

-- Країни
INSERT INTO Countries (ID, Name)
VALUES (1, 'Country1'), (2, 'Country2');
-- Спочатку товари
INSERT INTO Products (ProductID, ProductName)
VALUES (1, 'AwersomeProduct');
-- Склади
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID)
VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID)
VALUES (2, 'Warehouse-2', 'City-2, Street-2', 2);
-- Потім інвентар (посилання на товар та склад)
INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
VALUES (1, 1, 1, 2);
INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
VALUES (2, 1, 2, 5);
