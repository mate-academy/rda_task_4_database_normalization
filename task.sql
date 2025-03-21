CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries(
	ID INT,
    Name VARCHAR(50),
	City VARCHAR(50),
    Street VARCHAR(50),
    PRIMARY KEY (ID)
);
CREATE TABLE Warehouses (
    ID INT,
    Name VARCHAR(50),
    LocationID INT, 
    FOREIGN KEY (LocationID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Products(
	ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

INSERT INTO Countries (ID,Name,City,Street)
	VALUES (1,'Country1','City-1','Street-1');
INSERT INTO Countries (ID,Name,City,Street)
	VALUES (2,'Country2','City-2','Street-2');
    
INSERT INTO Warehouses (ID,Name,LocationID)
	VALUES (1,'Warehouse-1',1);
INSERT INTO Warehouses (ID,Name,LocationID)
	VALUES (2,'Warehouse-2',2);

INSERT INTO Products(ID,Name)
	VALUES (1, 'AwersomeProduct');
    
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
	VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID)
	VALUES (2, 1, 5, 2);
