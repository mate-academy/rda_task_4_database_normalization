CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
	  ID INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50), 
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseAmount INT,
    WarehousesID INT,
    FOREIGN KEY (WarehousesID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

INSERT INTO Countries (ID, Name)
	VALUES (1, 'Country1'), (2, 'Country2');
    
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID)
	VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1),
          (2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (ID, Name)
  VALUES (1, 'AwersomeProduct');
    
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehousesID)
	VALUES (1, 1, 2, 1),
          (2, 1, 5, 2);
