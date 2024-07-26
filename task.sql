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
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    Amount INT,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);


INSERT INTO Countries (ID,Name)
VALUES (1, 'Ukraine');
INSERT INTO Countries (ID,Name)
VALUES (2, 'USA');

INSERT INTO Products (ID,Name)
VALUES (1, 'Product1');
INSERT INTO Products (ID,Name)
VALUES (2, 'Product2');

INSERT INTO Warehouses (ID,Name,Address,CountryID)
VALUES (1, 'Warehouse1', 'City1, Street1',1);
INSERT INTO Warehouses (ID,Name,Address,CountryID)
VALUES (2, 'Warehouse2', 'City2, Street2',2);

INSERT INTO ProductInventory (ID,ProductID,Amount,WarehouseID)
VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID,ProductID,Amount,WarehouseID)
VALUES (2, 2, 5, 2);

