DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;


CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);


CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);


CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);


CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT UNSIGNED NOT NULL DEFAULT 0,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID),
    UNIQUE (ProductID, WarehouseID)
);

INSERT INTO Countries (Name)
VALUES ('Country1'), ('Country2');

INSERT INTO Warehouses (Name, Address, CountryID)
VALUES 
('Warehouse-1', 'City-1, Street-1', 1),
('Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (Name)
VALUES ('AwesomeProduct');

INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
VALUES 
(1, 1, 2),
(1, 2, 5);
