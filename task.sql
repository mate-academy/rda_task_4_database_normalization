-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Adress VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);


CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
	FOREIGN KEY (ProductID) REFERENCES Products(ID),
	FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1'), (2, 'Country2');

INSERT INTO Warehouses (ID, Name, Adress, CountryID)
    VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1), (2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (ID, Name)
    VALUES (1, 'AwesomeProduct');

INSERT INTO ProductInventory (ID,ProductID,WarehouseID,WarehouseAmount)
	VALUES (1, 1, 1, 2), (2, 1, 2, 5);
