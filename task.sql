-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

create table Warehouse (
	ID int,
    Name varchar(50),
    Address varchar(50),
    CountryID int,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
	primary key (ID)
);

create table Product (
	ID int,
    Name VARCHAR(50),
    primary key (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    WarehouseAmount INT,
    ProductID int,
    WarehouseID int,
    foreign key (WarehouseID) references Warehouse(ID) on delete no action,
    foreign key (ProductID) references Product(ID) on delete no action,	
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
    
insert into Product (ID,Name)
	values (1, 'AwersomeProduct');
    
insert into Warehouse (ID,Name,Address,CountryID)
	values (1, 'Warehouse-1', 'City-1, Street-1', 1);
    
insert into Warehouse (ID,Name,Address,CountryID)
	values (2, 'Warehouse-2', 'City-2, Street-2', 2);
    
INSERT INTO ProductInventory (ID,ProductID,WarehouseAmount,WarehouseID)
	VALUES (1, 1, 2, 1);
INSERT INTO ProductInventory (ID,ProductID,WarehouseAmount,WarehouseID)
	VALUES (2, 1, 5, 2);
