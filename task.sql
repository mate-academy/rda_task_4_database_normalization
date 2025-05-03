CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

CREATE TABLE IF NOT EXISTS Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Warehouses (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE IF NOT EXISTS Products (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

INSERT INTO Countries (ID, Name) VALUES (1, 'Country1'), (2, 'Country2');

INSERT INTO Warehouses (ID, Name, Address, CountryID)
VALUES
  (1, 'Warehouse-1', 'City-1, Street-1', 1),
  (2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (ID, Name)
VALUES
  (1, 'AwesomeProduct'),
  (2, 'AnotherProduct');

INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
VALUES
  (1, 1, 2, 1),
  (2, 1, 5, 2);
