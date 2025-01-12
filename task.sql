CREATE DATABASE ShopDB;
USE ShopDB;


CREATE TABLE Countries (
   ID INT AUTO_INCREMENT,
   Name VARCHAR(50),
   PRIMARY KEY (ID)
);


CREATE TABLE Product (
   ID INT AUTO_INCREMENT,
   ProductName VARCHAR(50) UNIQUE,
   PRIMARY KEY(ID)
);


CREATE TABLE Warehouse (
   ID INT AUTO_INCREMENT,
   WarehouseName VARCHAR(50),
   WarehouseAddress VARCHAR(50),
   CountryID INT,
   FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
   PRIMARY KEY (ID)
);


CREATE TABLE ProductInventory (
   ID INT AUTO_INCREMENT,
   ProductID INT,
   WarehouseAmount INT,
   WarehouseID INT,
   FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE NO ACTION,
   FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
   PRIMARY KEY (ID)
);


INSERT INTO Countries (Name)
   VALUES ('Country1');
INSERT INTO Countries (Name)
   VALUES ('Country2');


INSERT INTO Product (ProductName)
   VALUES ('AwersomeProduct');

INSERT INTO Warehouse (WarehouseName, WarehouseAddress, CountryID)
   VALUES ('Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouse (WarehouseName, WarehouseAddress, CountryID)
   VALUES ('Warehouse-2', 'City-2, Street-2', 2);


INSERT INTO ProductInventory (ProductID, WarehouseAmount, WarehouseID)
   VALUES (1, 2, 1);
INSERT INTO ProductInventory (ProductID, WarehouseAmount, WarehouseID)
   VALUES (1, 5, 2);
