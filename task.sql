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
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseID INT,
    Amount INT,
    PRIMARY KEY (ID),
	FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES 
    (1, 'Country1'),
    (2, 'Country2');

INSERT INTO Products (ID, Name)
    VALUES
    (1, 'Product1'),
    (2, 'Product2');

INSERT INTO Warehouses (ID,Name,Address,CountryID)
	VALUES 
    (1, 'Warehouse1', 'City1, Street1', 1),
    (2, 'Warehouse2', 'City2, Street2', 2);
    
INSERT INTO ProductInventory (ID,ProductID,WarehouseID,Amount)
	VALUES 
    (1, 1, 1, 1),
    (2, 1, 2, 3);
