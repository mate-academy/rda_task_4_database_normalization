DROP DATABASE IF EXISTS ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;


CREATE TABLE Countries
(
    ID   INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses
(
    ID               INT AUTO_INCREMENT,
    CountryID        INT,
    FOREIGN KEY (CountryID) REFERENCES Countries (ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
    WarehouseAddress VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE INDEX CountryID ON Warehouses (CountryID);


CREATE TABLE Products
(
    ID          INT AUTO_INCREMENT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);


CREATE TABLE ProductInventory
(
    ID              INT AUTO_INCREMENT,
    ProductID       INT,
    FOREIGN KEY (ProductID) REFERENCES Products (ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
    WarehouseAmount INT,
    WarehouseID     INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses (ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE INDEX ProductID ON ProductInventory (ProductID);
CREATE INDEX WarehouseID ON ProductInventory (WarehouseID);

-- ---------------- INSERTED DATA -----------------

-- Countries
INSERT INTO Countries (ID, Name)
VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name)
VALUES (2, 'Country2');

-- Warehouses
INSERT INTO Warehouses (ID, CountryID, WarehouseAddress) VALUES (1, 1, "City-1, Street-1");
INSERT INTO Warehouses (ID, CountryID, WarehouseAddress) VALUES (2, 2, "City-2, Street-2");

-- Products
INSERT INTO Products (ID, ProductName) VALUES (1, "AwersomeProduct");

-- Products Inventory
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID) VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID) VALUES (2, 1, 5, 2);
