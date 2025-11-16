CREATE DATABASE ShopDB;


USE  ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products(
	ProductId INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(50)
);



CREATE TABLE Warehouse(
	WarehouseID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50), 
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);




CREATE TABLE ProductInventory(
	ProductID INT NOT NULL ,
    ProductAmount INT NOT NULL,
    Warehouse_ID INT NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (Warehouse_ID) REFERENCES Warehouse(WarehouseID),
    PRIMARY KEY (ProductID, Warehouse_ID)
);

INSERT INTO Countries(ID, Name)
	VALUES(1, "Country1");
INSERT INTO Countries(ID, Name)
	VALUES(2,"Country2")

INSERT INTO Products(Name)
	VALUES ("AwersomeProduct");
	
INSERT INTO Warehouse(WarehouseName, WarehouseAddress, CountryID)
	VALUES("Warehouse-1","City-1, Street-1",1);
INSERT INTO Warehouse(WarehouseName, WarehouseAddress, CountryID)
	VALUES("Warehouse-2", "City-2, Street-2",2);


INSERT INTO ProductInventory(ProductID, ProductAmount,Warehouse_ID)
	VALUES (1, 2, 1);
INSERT INTO ProductInventory(ProductID,ProductAmount,Warehouse_ID)
	VALUES(1, 5, 2);

