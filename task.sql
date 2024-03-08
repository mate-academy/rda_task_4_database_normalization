CREATE DATABASE IF NOT EXISTS ShopDB;
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
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
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
    Amount INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);

-- Populate test data
INSERT INTO Countries (Name) VALUES ('Country1'), ('Country2');

INSERT INTO Warehouses (Name, Address, CountryID) 
VALUES ('Warehouse-1', 'City-1, Street-1', 1), 
       ('Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (Name) VALUES ('AwesomeProduct');

INSERT INTO ProductInventory (ProductID, WarehouseID, Amount)
VALUES ((SELECT ID FROM Products WHERE Name = 'AwesomeProduct'), (SELECT ID FROM Warehouses WHERE Name = 'Warehouse-1'), 2),
       ((SELECT ID FROM Products WHERE Name = 'AwesomeProduct'), (SELECT ID FROM Warehouses WHERE Name = 'Warehouse-2'), 5);
