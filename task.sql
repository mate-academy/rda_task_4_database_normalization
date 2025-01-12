CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Warehouses (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Products (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    Amount INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE
);


INSERT INTO Countries (Name) VALUES ('USA'), ('Canada');

INSERT INTO Warehouses (Name, Address, CountryID) VALUES
    ('Warehouse 1', '123 Main St', 1),
    ('Warehouse 2', '456 Elm St', 2);

INSERT INTO Products (Name) VALUES ('Orange'), ('Butter');

INSERT INTO ProductInventory (ProductID, WarehouseID, Amount) VALUES
    (1, 1, 100),
    (1, 2, 200),
    (2, 1, 50),
    (2, 2, 100);
