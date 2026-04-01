DROP DATABASE IF EXISTS ShopDB; 

CREATE DATABASE ShopDB;


USE ShopDB;


Create Table Countries (
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ID),
    NAME VARCHAR(50)
);

CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ID),
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Product (
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ID),
    Name VARCHAR(50)
);
CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ID),
    Amount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    ProductId INT,
    FOREIGN KEY (ProductId) REFERENCES Product(ID) ON DELETE CASCADE
);


INSERT INTO Countries (NAME)
    VALUES ('Country1'), ('Country2');


INSERT INTO Warehouses (WarehouseName, WarehouseAddress, CountryID)
    VALUES ('Warehouse-1', 'City-1, Street-1', 1), ('Warehouse-2', 'City-2, Street-1', 2);

INSERT INTO Product (Name)
    VALUES ('Product-1'), ('Product-2');

INSERT INTO ProductInventory (WarehouseID, ProductID, Amount)
    VALUES (1, 1, 2), (2, 2, 5); 
