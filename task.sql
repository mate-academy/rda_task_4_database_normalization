CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(100),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);

INSERT INTO Countries (ID, Name)
    VALUES (1, "Country1"), (2, "Country2");

INSERT INTO Products (ID, Name)
    VALUES (1, "AwersomeProduct");

INSERT INTO Warehouses (ID, Name, Address, CountryID)
    VALUES (1, "Warehouse-1", "City-1, Street-1", 1),
           (2, "Warehouse-2", "City-2, Street-2", 2);

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
    VALUES (1, 1, 1, 2),
           (2, 1, 2, 5);
