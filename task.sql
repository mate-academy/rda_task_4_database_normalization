-- Create database and tables
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Warehouse (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(50)
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID)
);

INSERT INTO Countries (Name) VALUES ('Country1');
INSERT INTO Warehouse (WarehouseName, CountryID, WarehouseAddress) VALUES ('Warehouse-1', 1, 'City-1, Street-1'), ('Warehouse-2', 1, 'City-2, Street-2');
INSERT INTO Products (ProductName) VALUES ('AwesomeProduct');

INSERT INTO ProductInventory (ProductID, WarehouseAmount, WarehouseID)
VALUES (1, 10, 1), (1, 20, 2);