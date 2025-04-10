CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE WarehouseAddresses (
    WarehouseID INT PRIMARY KEY,
    Address VARCHAR(50),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

INSERT INTO Countries (ID, Name) VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name) VALUES (2, 'Country2');

INSERT INTO Warehouses (ID, Name, CountryID) VALUES (1, 'Warehouse-1', 1);
INSERT INTO Warehouses (ID, Name, CountryID) VALUES (2, 'Warehouse-2', 2);

INSERT INTO WarehouseAddresses (WarehouseID, Address) VALUES (1, 'City-1, Street-1');
INSERT INTO WarehouseAddresses (WarehouseID, Address) VALUES (2, 'City-2, Street-2');

INSERT INTO ProductInventory (ID, ProductName, WarehouseAmount, WarehouseID) VALUES (1, 'AwersomeProduct', 2, 1);
INSERT INTO ProductInventory (ID, ProductName, WarehouseAmount, WarehouseID) VALUES (2, 'AwersomeProduct', 5, 2);
