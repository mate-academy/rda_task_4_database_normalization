DROP DATABASE IF EXISTS ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(255) NOT NULL,
    WarehouseAddress VARCHAR(255) NOT NULL,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL
);

CREATE TABLE Inventory (
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT NOT NULL,
    PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);


INSERT INTO Countries (Name) VALUES ('USA');
INSERT INTO Countries (Name) VALUES ('Canada');

INSERT INTO Products (ProductName) VALUES ('Product A');
INSERT INTO Products (ProductName) VALUES ('Product B');

INSERT INTO Warehouses (WarehouseName, WarehouseAddress, CountryID) 
VALUES ('Warehouse 1', '123 Warehouse St, City A', 1);
INSERT INTO Warehouses (WarehouseName, WarehouseAddress, CountryID) 
VALUES ('Warehouse 2', '456 Warehouse Rd, City B', 2);

INSERT INTO Inventory (ProductID, WarehouseID, WarehouseAmount) 
VALUES (1, 1, 100);
INSERT INTO Inventory (ProductID, WarehouseID, WarehouseAmount) 
VALUES (1, 2, 150);
INSERT INTO Inventory (ProductID, WarehouseID, WarehouseAmount) 
VALUES (2, 1, 200);
INSERT INTO Inventory (ProductID, WarehouseID, WarehouseAmount) 
VALUES (2, 2, 50);
