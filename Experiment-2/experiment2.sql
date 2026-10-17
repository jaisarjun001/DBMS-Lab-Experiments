  -- EXPERIMENT 2: E-Commerce Database
-- DBMS Practical

-- 1. Create Database
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- 2. Create Customer Table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(30) NOT NULL,
    Middle_Name VARCHAR(30),
    Last_Name VARCHAR(30) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DOB DATE
);

-- 3. Create Customer_Phone Table
CREATE TABLE Customer_Phone (
    Customer_ID INT,
    Phone VARCHAR(15),
    PRIMARY KEY (Customer_ID, Phone),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE
);

-- 4. Create Address Table
CREATE TABLE Address (
    Address_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    House_No VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Pincode VARCHAR(10) NOT NULL,
    Address_Type VARCHAR(20),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE
);

-- 5. Create Seller Table
CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY,
    Seller_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    GSTIN VARCHAR(20) UNIQUE,
    Rating DECIMAL(3,1)
);

-- 6. Create Category Table
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL UNIQUE,
    Description VARCHAR(200)
);

-- 7. Create Product Table
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Description VARCHAR(200),
    Product_Type VARCHAR(20),
    Seller_ID INT NOT NULL,
    Category_ID INT,
    FOREIGN KEY (Seller_ID)
        REFERENCES Seller(Seller_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID)
        ON DELETE SET NULL
);

-- 8. Create Electronic_Product Table
CREATE TABLE Electronic_Product (
    Product_ID INT PRIMARY KEY,
    Brand VARCHAR(50),
    Warranty_Period INT,
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
        ON DELETE CASCADE
);

-- 9. Create Clothing_Product Table
CREATE TABLE Clothing_Product (
    Product_ID INT PRIMARY KEY,
    Size VARCHAR(10),
    Material VARCHAR(50),
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
        ON DELETE CASCADE
);

-- 10. Create Order Table
CREATE TABLE `Order` (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Order_Status VARCHAR(30) NOT NULL,
    Total_Amount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE
);

-- 11. Create Order_Item Table
CREATE TABLE Order_Item (
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(5,2) DEFAULT 0,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID)
        REFERENCES `Order`(Order_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
        ON DELETE CASCADE
);

-- 12. Create Payment Table
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL UNIQUE,
    Payment_Date DATE,
    Amount DECIMAL(12,2) NOT NULL,
    Payment_Method VARCHAR(30),
    Payment_Status VARCHAR(30),
    Transaction_ID VARCHAR(100) UNIQUE,
    FOREIGN KEY (Order_ID)
        REFERENCES `Order`(Order_ID)
        ON DELETE CASCADE
);

-- 13. Create Delivery Table
CREATE TABLE Delivery (
    Delivery_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL UNIQUE,
    Address_ID INT,
    Delivery_Date DATE,
    Delivery_Status VARCHAR(30),
    Tracking_Number VARCHAR(100) UNIQUE,
    FOREIGN KEY (Order_ID)
        REFERENCES `Order`(Order_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Address_ID)
        REFERENCES Address(Address_ID)
        ON DELETE SET NULL
);

-- INSERT SAMPLE DATA

-- Customer
INSERT INTO Customer
VALUES
(1, 'Arjun', NULL, 'Jaiswal',
 'arjun@gmail.com', '2007-05-19'),
(2, 'Rahul', NULL, 'Sharma',
 'rahul@gmail.com', '2006-06-15'),
(3, 'Priya', NULL, 'Verma',
 'priya@gmail.com', '2007-01-10');

-- Customer Phone
INSERT INTO Customer_Phone
VALUES
(1, '9876543610'),
(1, '9892534567'),
(2, '9988667766'),
(3, '8081096757');

-- Address
INSERT INTO Address
VALUES
(101, 1, 'CP', 'MG Road', 'Gorakhpur',
 'Uttar Pradesh', '273001', 'Home'),
(102, 2, 'TSB', 'Civil Lines', 'Lucknow',
 'Uttar Pradesh', '226001', 'Work'),
(103,
