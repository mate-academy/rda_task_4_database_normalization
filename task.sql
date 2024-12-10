CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
  ID INT AUTO_INCREMENT,
  Name VARCHAR(50),
  
  PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
  ID INT AUTO_INCREMENT,
  Name VARCHAR(50),
  Address VARCHAR(50),
  CountryID INT,

  PRIMARY KEY (ID),
  FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE CASCADE
);

CREATE TABLE Products (
  ID INT AUTO_INCREMENT,
  Name VARCHAR(50),

  PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
  ID INT AUTO_INCREMENT,
  ProductID INT,
  Amount INT,
  WarehouseID INT,

  PRIMARY KEY (ID),
  FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
  FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE
);

INSERT INTO Countries (ID, Name)
VALUES
  (1, 'Country1'),
  (2, 'Country2');

INSERT INTO Warehouses (ID, Name, Address, CountryID)
VALUES
  (1, 'Warehouse-1', 'City-1, Street-1', 1),
  (2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (ID, Name)
VALUES (1, 'AwersomeProduct');

INSERT INTO ProductInventory (ID, ProductID, Amount, WarehouseID)
VALUES
  (1, 1, 2, 1),
  (2, 1, 5, 2);
