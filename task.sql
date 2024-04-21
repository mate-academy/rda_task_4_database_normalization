DROP DATABASE IF EXISTS ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    WarehouseID INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (WarehouseID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ProductID)
);

CREATE TABLE ProductInventory (
    InventoryID INT,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    PRIMARY KEY (InventoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);

INSERT INTO Countries (ID, Name) VALUES
(1, 'Country1'),
(2, 'Country2');

INSERT INTO Warehouses (WarehouseID, WarehouseName, WarehouseAddress, CountryID) VALUES
(1, 'Warehouse-1', 'City-1, Street-1', 1),
(2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (ProductID, ProductName) VALUES
(1, 'AwesomeProduct');

INSERT INTO ProductInventory (InventoryID, ProductID, WarehouseID, WarehouseAmount) VALUES
(1, 1, 1, 2),
(2, 1, 2, 5);
