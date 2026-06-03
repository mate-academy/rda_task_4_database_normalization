-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
	ID INT AUTO_INCREMENT,
    ProductName VARCHAR(50),
    PRIMARY KEY(ID)
);

CREATE TABLE Warehouse (
	ID INT AUTO_INCREMENT,
    WarehouseName VARCHAR(50),
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    WarehouseAddress VARCHAR(50),
    PRIMARY KEY(ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse (ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID, Name)
	VALUES (1, 'Country1'),
	        (2, 'Country2');

INSERT INTO Warehouse (ID, WarehouseName, CountryID, WarehouseAddress)
				VALUES (1, "Warehouse1", 1, "WarehouseAddress1"),
				        (2, "Warehouse2", 2, "WarehouseAddress2");

INSERT INTO Products (ID, ProductName)
				VALUES (1, "ProductName1"),
				        (2, "ProductName2");

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
	            VALUES (1, 1, 1, 11),
	                    (2, 2, 2, 22);