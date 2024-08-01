-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

Create TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name varchar(50),
    Address Varchar(250),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);


Create table Products (
    ID INT AUTO_INCREMENT,
    Name varchar(50),
    PRIMARY KEY (ID)
);


CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
    PRIMARY KEY(ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);

-- Populate test data

INSERT INTO Countries (ID,Name) VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name) VALUES (2, 'Country2');

INSERT INTO Warehouses (Name, Address, CountryID) VALUES ('Warehouse-1','City-1 - Street-1',1);
INSERT INTO Warehouses (Name, Address, CountryID) VALUES ('Warehouse-2','City-2 - Street-2',2);

INSERT INto Products (Name) VALUES ('Super-ukrainianProduct');
    
INSERT INTO ProductInventory (ProductID,WarehouseAmount,WarehouseID) VALUES (1, 2, 1);
INSERT INTO ProductInventory (ProductID,WarehouseAmount,WarehouseID) VALUES (1, 5, 2);
