-- Create database and tables
DROP DATABASE IF EXISTS ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
);

CREATE TABLE Products (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50)
);

CREATE TABLE Warehouses (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    WarehouseName VARCHAR(50) NOT NULL,
    WarehouseAddress VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Inventory (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE
);

INSERT INTO Countries (Name)
	VALUES ('Country1');
INSERT INTO Countries (Name)
	VALUES ('Country2');
    
INSERT INTO Products (ProductName)
	VALUES ('AwesomeProduct');
INSERT INTO Products (ProductName)
	VALUES ('AwesomeProduct2');

INSERT INTO Warehouses (WarehouseName, WarehouseAddress, CountryID)
	VALUES ('warehouse1', 'city-1, street-1', 1);
INSERT INTO Warehouses (WarehouseName, WarehouseAddress, CountryID)
	VALUES ('warehouse2', 'city-2, street-2', 2);

INSERT INTO Inventory (ProductID, WarehouseID, WarehouseAmount)
	VALUES (1, 1, 2);
INSERT INTO Inventory (ProductID, WarehouseID, WarehouseAmount)
	VALUES (2, 2, 3);