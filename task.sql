-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
        ON DELETE RESTRICT
);

CREATE TABLE Inventory (
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    Amount INT NOT NULL,
    PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID)
        ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
        ON DELETE CASCADE
);

-- Populate test data

INSERT INTO Countries (Name) VALUES
    ('Country1'),
    ('Country2');

INSERT INTO Products (Name) VALUES
    ('AwesomeProduct');

INSERT INTO Warehouses (Name, Address, CountryID) VALUES
    ('Warehouse-1', 'City-1, Street-1', 1),
    ('Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Inventory (ProductID, WarehouseID, Amount) VALUES
    (1, 1, 2),
    (1, 2, 5);
