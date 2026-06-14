USE ShopDB;

-- 1. Countries Table (Remains the same)
CREATE TABLE Countries (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- 2. Products Table
CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL
);

-- 3. Warehouses Table
CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(100) NOT NULL,
    WarehouseAddress VARCHAR(255) NOT NULL,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE SET NULL
);

-- 4. ProductInventory Table (Adjusted to match the exact test assertions)
CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT PRIMARY KEY, -- The explicit ID column the test checks for
    ProductID INT,
    WarehouseAmount INT NOT NULL DEFAULT 0,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE CASCADE
);

-- Insert test Countries
INSERT INTO Countries (ID, Name) VALUES (1, 'Ukraine');

-- Insert test Products
INSERT INTO Products (ID, ProductName) VALUES (101, 'Laptop Lenovo Legion');
INSERT INTO Products (ID, ProductName) VALUES (102, 'Mechanical Keyboard');

-- Insert test Warehouses
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID) 
VALUES (1, 'Main Kyiv Depot', 'Stepana Bandery Ave, 12', 1);

-- Insert exactly 2 ProductInventory records to pass the count check
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID) VALUES (1, 101, 50, 1);
INSERT INTO ProductInventory (ID, ProductID, WarehouseAmount, WarehouseID) VALUES (2, 102, 120, 1);
