-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouse (
    ID INT,
    PRIMARY KEY (ID),
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Product(
    ID INT,
    PRIMARY KEY (ID),
    Name VARCHAR(50)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductId INT,
    WarehouseAmount INT,
    FOREIGN KEY (ProductId) REFERENCES Product(ID) ON DELETE NO ACTION,
	WarehouseID INT,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);



-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Warehouse(id, Name, Address, CountryID)
    VALUE(1,'Warehouse-1', 'City-1, Street-1', 1);

INSERT INTO Warehouse(id, Name, Address, CountryID)
    VALUE(2,'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Product(id, Name)
    VALUE(1,'AwersomeProduct');

INSERT INTO ProductInventory (ID,ProductId,WarehouseAmount, WarehouseID)
	VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID,ProductId,WarehouseAmount, WarehouseID)
	VALUES (2, 1, 5, 2);
