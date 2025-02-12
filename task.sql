-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(100),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);
CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT,
    ProductID INT,
    WarehouseID INT,
	WarehouseAmount INT NOT NULL CHECK (WarehouseAmount >= 0),
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Warehouses (Name, Address, CountryID)
VALUES ('Warehouse-1', 'City-1, Street-1', 1),
       ('Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (Name) VALUES ('AwesomeProduct');

INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
VALUES (1, 1, 2),
       (1, 2, 5);