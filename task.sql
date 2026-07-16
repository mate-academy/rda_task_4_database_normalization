-- Create database and tables
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

-- 1. Створюємо таблицю для товарів
CREATE TABLE Products (
    ID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

-- 2. Створюємо таблицю для складів
CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

-- 3. Створюємо таблицю-зв'язковий для інвентарю
CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    WarehouseAmount INT,
    ProductID INT,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Populate test data

INSERT INTO Countries (ID, Name)
    VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name)
    VALUES (2, 'Country2');

-- Заповнюємо товар
INSERT INTO Products (ID, ProductName)
    VALUES (1, 'AwersomeProduct');

-- Заповнюємо склади
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID)
    VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID)
    VALUES (2, 'Warehouse-2', 'City-2, Street-2', 2);

-- Заповнюємо кількість товарів на конкретних складах
INSERT INTO ProductInventory (ID, WarehouseAmount, ProductID, WarehouseID)
    VALUES (1, 2, 1, 1);
INSERT INTO ProductInventory (ID, WarehouseAmount, ProductID, WarehouseID)
    VALUES (2, 5, 1, 2);