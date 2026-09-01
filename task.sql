DROP DATABASE IF EXISTS ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries
(
    ID   INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Cities
(
    ID   INT AUTO_INCREMENT,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries (ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);
CREATE INDEX CountryID ON Cities (CountryID);

CREATE TABLE Warehouses
(
    ID        INT AUTO_INCREMENT,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES Cities (ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
    WarehouseAddress   VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE INDEX CityID ON Warehouses (CityID);

CREATE TABLE ProductInventory
(
    ID              INT AUTO_INCREMENT,
    ProductName     VARCHAR(50),
    WarehouseAmount INT,
    WarehouseID     INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses (ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE INDEX Name ON ProductInventory (WarehouseID);

-- Countries
INSERT INTO Countries (ID, Name) VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name) VALUES (2, 'Country2');

-- Cities
INSERT INTO Cities (ID, CountryID, Name) VALUES (1, 1, 'City-1');
INSERT INTO Cities (ID, CountryID, Name) VALUES (2, 2, 'City-2');

-- Warehouses
INSERT INTO Warehouses (ID, CityID, WarehouseAddress) VALUES (1, 1, 'Street-1');
INSERT INTO Warehouses (ID, CityID, WarehouseAddress) VALUES (2, 2, 'Street-2');

-- Products
INSERT INTO ProductInventory (ID, ProductName, WarehouseAmount, WarehouseID)
VALUES (1, 'AwersomeProduct', 2, 1);
INSERT INTO ProductInventory (ID, ProductName, WarehouseAmount, WarehouseID)
VALUES (2, 'AwersomeProduct', 5, 2);
