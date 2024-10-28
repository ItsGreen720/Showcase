-- Creating the 'Supplier' table
CREATE TABLE Supplier (
    SupplierID VARCHAR(255) PRIMARY KEY,
    Supplier_Name VARCHAR(255),
    Supplier_Contact INT,
    Email_Address VARCHAR(255)
);

CREATE TABLE Restock (
    InventoryID VARCHAR(255),
    SupplierID VARCHAR(255),
    restock_date DATETIME,
    restock_quantity INT,
    restock_price VARCHAR(255),
    PRIMARY KEY (InventoryID, SupplierID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);


-- Creating the 'Inventory' table
CREATE TABLE Inventory (
    InventoryID VARCHAR(255) PRIMARY KEY,
    product_name VARCHAR(255),
    product_type VARCHAR(255),
    product_quantity INT,
    product_weight DECIMAL(3,2),
    product_cost DECIMAL(3,2)
);

-- Creating the 'Customer' table
CREATE TABLE Customer (
    CustomerID VARCHAR(255) PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Phone_Number BIGINT,
    Email_Address VARCHAR(255),
    Date_of_Birth DATETIME,
    Reward_Points INT
);

-- Creating the 'Orders' table
CREATE TABLE Orders (
    OrderID VARCHAR(255) PRIMARY KEY,
    Item_Name VARCHAR(255),
    Item_Quantity INT,
    Item_Price DECIMAL(2,2),
    CustomerID VARCHAR(255),
    InventoryID VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
);

-- Creating the 'Inventory History' table
CREATE TABLE Inventory_History (
    InvHistID VARCHAR(255),
    InventoryID VARCHAR(255),
    exp_date DATETIME,
    used_date DATETIME,
    Restock_date DATETIME,
    PRIMARY KEY (InvHistID, InventoryID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
);

-- Creating the 'Location' table
CREATE TABLE Location (
    LocationID VARCHAR(255) PRIMARY KEY,
    Manager_FirstName VARCHAR(255),
    Manager_LastName VARCHAR(255),
    ManagerID INT,
    Location_Grade INT,
    Inventory_ID VARCHAR(255),
    FOREIGN KEY (Inventory_ID) REFERENCES Inventory(InventoryID)
);

-- Note that any INT columns do not have a width specified in the corrected SQL.


--Supplier inserts

INSERT INTO Supplier (SupplierID, Supplier_Name, Supplier_Contact, Email_Address) VALUES ('c6be6432-17ee-4eb0-baca-af82374a6cc9', 'Chan, Hale and Fisher', 1487242132, 'bsnow@walls.com');
INSERT INTO Supplier (SupplierID, Supplier_Name, Supplier_Contact, Email_Address) VALUES ('27f9e728-c618-4c1e-aa48-05421965e435', 'Blevins, Moody and Jordan', 2791085173, 'ucalhoun@king.com');
INSERT INTO Supplier (SupplierID, Supplier_Name, Supplier_Contact, Email_Address) VALUES ('028d042b-2d8b-4b41-990e-83da586f1721', 'Fuentes Inc', 12131313, 'harrisemily@adkins.com');



SELECT * FROM [Inventory]