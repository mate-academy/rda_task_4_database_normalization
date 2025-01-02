CREATE DATABASE ShopDB;    
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    WarehouseID INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (WarehouseID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (ProductID)
);

CREATE TABLE ProductInventory (
    WarehouseAmount INT,
    WarehouseID INT,
    ProductID INT,
    ID INT AUTO_INCREMENT PRIMARY KEY,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID) ON DELETE NO ACTION,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE NO ACTION
);

INSERT INTO Countries (ID, Name)
VALUES (1, 'Country1'), (2, 'Country2');

INSERT INTO Warehouses (WarehouseID, WarehouseName, WarehouseAddress, CountryID)
VALUES 
    (1, 'Warehouse-1', 'City-1, Street-1', 1),
    (2, 'Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Products (ProductID, ProductName)
VALUES 
    (1, 'AwesomeProduct'),
    (2, 'AwesomeProduct');
 

INSERT INTO ProductInventory (ProductID, WarehouseID, WarehouseAmount)
VALUES 
    (1, 1, 2),
    (2, 2, 5);
