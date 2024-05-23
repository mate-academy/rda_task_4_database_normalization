* **Given is the** **​`ShopDB`​** **database with two tables:**

  *The current database structure already conforms to the First Normal Form, as each cell contains only one indivisible value.*

  | <u>Countries</u><br /> |          |
  | ---- | ---------- |
  | **ID**(PK)   | Name     |
  | 1  | Country1 |
  | 2  | Country2 |



  | <u>Product Inventory</u><br /> |                  |                      |                    |                       |   |
  | ---- | ------------------ | ---------------------- | -------------------- | ----------------------- | --- |
  | **ID**(PK)   | Product <br />Name<br /> | Warehouse <br />Amount<br /> | Warehouse <br />Name<br /> | Warehouse <br />Address<br /> | *CountryID(FK)*   |
  | 1  | AwersomeProduct  | 2                    | Warehouse-1        | City-1, Street-1      | 1 |
  | 2  | AwersomeProduct  | 5                    | Warehouse-2<br />      | City-2, Street-2      | 2 |
* **At this stage, we have to modify our database to conform to the Second Normal Form.**

  *To achieve this, we need to move all repeating data into separate tables.*

  | Products List |                 |
  | --------------- | ----------------- |
  | **ID**(PK)              | Product Name    |
  | 1             | AwersomeProduct |

  | Countries |          |
  | ----------- | ---------- |
  | **ID**(PK)          | Country  |
  | 1         | Country1 |
  | 2         | Country2 |


  | Warehouses |             |   |                  |
  | ------------ | ------------- | --- | ------------------ |
  | **ID**(PK)           | Warehouse   | *CountryID(FK)*   | Address          |
  | 1          | Warehouse-1 | 1 | City-1, Street-1 |
  | 2          | Warehouse-2 | 2 | City-2, Street-2 |

  | Inventory<br /> |   |   |        |
  | ------------- | --- | --- | -------- |
  | **ID**(PK)            | *ProductID(FK)*   | *WarehouseID(FK)*   | Amount |
  | 1           | 1 | 1 | 2      |
  | 2           | 1 | 2 | 5      |

  Upon analyzing our database, we see that it already conforms to the Third Normal Form **,** 
  
   *(as none of the tables contain transitive dependencies.)*

To complete the task, we need to write a script to build the appropriate database structure and fill it with the existing data.

```sql
-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE `Products List` (		### Note that in our script we use GRAVE ACCENT symbol (`)
									### to create complex names
GRAVE ACCENT symbol (`)
    ID INT,
    `Product Name` VARCHAR(50),
  
	PRIMARY KEY (ID)
);

CREATE TABLE Countries (
    ID INT,
    Country VARCHAR(50),
  
	PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT,
	Warehouse VARCHAR(50),
    CountryID INT,
    Address VARCHAR(50),
  
	PRIMARY KEY (ID),
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Inventory (
    ID INT,
    ProductID INT,
    WarehouseID INT,
    Amount INT,
  
	PRIMARY KEY (ID),
	FOREIGN KEY (ProductID) REFERENCES `Products List`(ID) ON DELETE NO ACTION,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);


-- Insert Data

INSERT INTO `Products List` (ID,`Product Name`)
	VALUES (1, 'AwersomeProduct');

INSERT INTO Countries (ID,Country)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Country)
	VALUES (2, 'Country2');
  
INSERT INTO Warehouses (ID,Warehouse,CountryID,Address)
	VALUES (1, 'Warehouse-1', 1, 'City-1, Street-1');
INSERT INTO Warehouses (ID,Warehouse,CountryID,Address)
	VALUES (2, 'Warehouse-2', 2, 'City-2, Street-2');

INSERT INTO Inventory (ID,ProductID,WarehouseID,Amount)
	VALUES (1, 1, 1, 2);
INSERT INTO Inventory (ID,ProductID,WarehouseID,Amount)
	VALUES (2, 1, 2, 5);

```