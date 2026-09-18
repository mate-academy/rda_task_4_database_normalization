-- Create database and tables
DROP DATABASE IF EXISTS ShopDB;

CREATE DATABASE ShopDB;

USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);

-- Populate test data
INSERT INTO
    Countries (name)
VALUES
    ('Country1');

INSERT INTO
    Countries (name)
VALUES
    ('Country2');

INSERT INTO
    Products (name)
VALUES
    ('AwersomeProduct');

INSERT INTO
    Warehouses(name, Address, CountryID)
VALUES
    (
        'Warehouse-1',
        'City-1, Street-1',
        (
            SELECT
                ID
            FROM
                Countries
            WHERE
                name = 'Country1'
        )
    );

INSERT INTO
    Warehouses(name, Address, CountryID)
VALUES
    (
        'Warehouse-2',
        'City-2, Street-2',
        (
            SELECT
                ID
            FROM
                Countries
            WHERE
                name = 'Country2'
        )
    );

INSERT INTO
    ProductInventory(ProductID, WarehouseID, WarehouseAmount)
VALUES
    (
        (
            SELECT
                ID
            FROM
                Products
            WHERE
                name = 'AwersomeProduct'
        ),
        (
            SELECT
                ID
            FROM
                Warehouses
            WHERE
                name = 'Warehouse-1'
        ),
        2
    );

INSERT INTO
    ProductInventory(ProductID, WarehouseID, WarehouseAmount)
VALUES
    (
        (
            SELECT
                ID
            FROM
                Products
            WHERE
                name = 'AwersomeProduct'
        ),
        (
            SELECT
                ID
            FROM
                Warehouses
            WHERE
                name = 'Warehouse-2'
        ),
        5
    );