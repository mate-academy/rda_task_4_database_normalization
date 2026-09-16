-- Create database and tables
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT,
    ProductName VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID)
        REFERENCES Countries(ID)
        ON DELETE NO ACTION
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ProductID INT,
    WarehouseID INT,
    Amount INT,

    PRIMARY KEY (ProductID, WarehouseID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ID)
        ON DELETE CASCADE,

    FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(ID)
        ON DELETE CASCADE
);
-- Populate test data

INSERT INTO Countries (ID, Name)
VALUES
    (1, 'Country1'),
    (2, 'Country2');

INSERT INTO Products (ID, ProductName, CountryID)
VALUES
    (1, 'AwersomeProduct', 1),
    (2, 'AwersomeProduct', 2);

INSERT INTO Warehouses (Name, Address)
VALUES
    ('Warehouse-1', 'City-1, Street-1'),
    ('Warehouse-2', 'City-2, Street-2');

INSERT INTO ProductInventory (ProductID, WarehouseID, Amount)
VALUES
    (1, 1, 2),
    (2, 2, 5);