CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT auto_increment,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
	ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    Amount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
    
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
    
INSERT INTO Products (Name)
	VALUES ('AwersomeProduct');

INSERT INTO Warehouses (Name, Address, CountryID)
	VALUES ('Warehouse-1', 'City-1, Street-1', 1);

INSERT INTO Warehouses (Name, Address, CountryID)
	VALUES ('Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO ProductInventory (ID,ProductID,Amount,WarehouseID)
	VALUES (1, 1, 2, 1);

INSERT INTO ProductInventory (ID,ProductID,Amount,WarehouseID)
	VALUES (2, 1, 5, 2);
