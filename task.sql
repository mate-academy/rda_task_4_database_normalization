-- 0. Очистити стару базу, якщо існує
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- 1. Таблиця країн
CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

-- 2. Таблиця продуктів
CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

-- 3. Таблиця складів
CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

-- 4. Таблиця залишків товарів
CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Дані для країн
INSERT INTO Countries (ID, Name) VALUES
(1, 'Country1'),
(2, 'Country2');

-- Дані для продуктів
INSERT INTO Products (Name) VALUES
('AwersomeProduct'); -- ID = 1

-- Дані для складів
INSERT INTO Warehouses (Name, Address, CountryID) VALUES
('Warehouse-1', 'City-1, Street-1', 1), -- ID = 1
('Warehouse-2', 'City-2, Street-2', 2); -- ID = 2

-- Дані для ProductInventory (саме 2 записи)
INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount) VALUES
(1, 1, 2),
(1, 2, 5);
