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
    ID INT AUTO_INCREMENT,
    ProductId INT,
    WarehouseId INT,
    WarehouseAmount INT,
	FOREIGN KEY (ProductId) REFERENCES Products(ID) ON DELETE NO ACTION,
	FOREIGN KEY (WarehouseId) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (id,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');

INSERT INTO Products (id,Name)
	VALUES (1,'Awersome Product');

INSERT INTO Warehouses (id, Name,Address,CountryID)
	VALUES (1,'Warehouse-1','City-1, Street-1',1);
INSERT INTO Warehouses (id, Name,Address,CountryID)
	VALUES (2, 'Warehouse-2','City-2, Street-2',2);

INSERT INTO ProductInventory (ProductId,WarehouseId, WarehouseAmount)
	VALUES (1,1,2);
INSERT INTO ProductInventory (ProductId,WarehouseId, WarehouseAmount)
	VALUES (1,2,5);
        