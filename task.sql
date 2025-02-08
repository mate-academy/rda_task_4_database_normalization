-- Create database and tables

CREATE DATABASE ShopDB;

USE ShopDB;

CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Warehouses (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL UNIQUE,
    Address VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries (ID) ON DELETE CASCADE
);

CREATE TABLE Products (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT NOT NULL CHECK (WarehouseAmount >= 0),
    FOREIGN KEY (ProductID) REFERENCES Products (ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses (ID) ON DELETE CASCADE
);

-- Populate test data

INSERT INTO
    Countries (ID, Name)
VALUES (1, 'Country1'),
    (2, 'Country2');

INSERT INTO
    Warehouses (Name, Address, CountryID)
VALUES (
        'Warehouse-1',
        'City-1, Street-1',
        1
    ),
    (
        'Warehouse-2',
        'City-2, Street-2',
        2
    );

INSERT INTO Products (Name) VALUES ('AwersomeProduct');

INSERT INTO
    ProductInventory (
        ProductID,
        WarehouseID,
        WarehouseAmount
    )
VALUES (1, 1, 2),
    (1, 2, 5);