-- Create database and tables

DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;


CREATE TABLE Countries (
ID INT AUTO_INCREMENT PRIMARY KEY,
 Name VARCHAR(255)
);

CREATE TABLE Products(
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(255)
);

CREATE TABLE Warehouses(
ID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(255),
Address VARCHAR(255),
CountryID INT,
FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);


CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    WarehouseID INT,
    Amount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Populate test data

INSERT INTO Countries (Name) VALUES ('Country1'), ('Country2');

INSERT INTO Products (Name) VALUES ('Product1'), ('Product2');

INSERT INTO Warehouses (Name, Address, CountryID) 
VALUES ('Warehouse-1', 'Street-1 City-1', 1),
      ('Warehouse-2', 'Street-2 City-2', 2);

INSERT INTO ProductInventory (ProductID, WarehouseID, Amount) 
VALUES (1, 1, 100),
      (1, 2, 50);


