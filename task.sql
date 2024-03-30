CREATE DATABASE IF NOT EXISTS ShopDB;

USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Product (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Warehouse (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
        FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
	ProductID INT,
	    FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE NO ACTION,
	WarehouseID INT,
	    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
	WarehouseAmount INT
);


INSERT INTO Countries (ID, Name)
	VALUES (1, 'Country1'),
           (2, 'Country2');

INSERT INTO Product (ID, Name)
	VALUES (1, 'AwersomeProduct');

INSERT INTO Warehouse (ID, WarehouseName, WarehouseAddress, CountryID)
	VALUES (1, 'Warehouse-1', 'City-1, Street-1',1),
	       (2, 'Warehouse-2', 'City-2, Street-2',2);

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, WarehouseAmount)
	VALUES (1, 1, 1, 2),
	       (2, 1, 2, 5);

