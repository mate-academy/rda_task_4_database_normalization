DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL
);

CREATE TABLE Warehouses (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  CountryID INT NOT NULL,
  FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE Products (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL
);

CREATE TABLE ProductInventory (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  ProductID INT NOT NULL,
  WarehouseID INT NOT NULL,
  Amount INT NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Products(ID),
  FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Виправлені INSERT-записи без вказівки ID
INSERT INTO Countries (Name) VALUES 
('USA'),
('Canada');

INSERT INTO Warehouses (Name, Address, CountryID) VALUES 
('Main Warehouse', '1234 Warehouse Ave', 1),
('Secondary Warehouse', '5678 Storage St', 2);

INSERT INTO Products (Name) VALUES 
('iPhone 13'),
('Samsung Galaxy S21');

-- Виправлений INSERT для ProductInventory
INSERT INTO ProductInventory (ProductID, WarehouseID, Amount) VALUES 
(1, 1, 100),
(2, 1, 50),
(1, 2, 200),
(2, 2, 150);
