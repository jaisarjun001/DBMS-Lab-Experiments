
-- Experiment 7: Database Normalization

-- Clean up tables so this script can be run again
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Sales;

-- Create the original denormalized sales table
CREATE TABLE Sales (
    OrderID INT,
    CustomerID INT,
    CustomerName VARCHAR(50),
    ProductID INT,
    ProductName VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2)
);

-- Insert sample records
INSERT INTO Sales (OrderID, CustomerID, CustomerName, ProductID, ProductName, Quantity, Price) VALUES
(1, 101, 'Amit', 201, 'Laptop', 2, 50000.00),
(1, 101, 'Amit', 202, 'Mouse', 3, 500.00),
(2, 102, 'Ravi', 201, 'Laptop', 1, 50000.00);

-- Create normalized tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Load normalized tables from Sales
INSERT INTO Customers (CustomerID, CustomerName)
SELECT DISTINCT CustomerID, CustomerName
FROM Sales;

INSERT INTO Orders (OrderID, CustomerID)
SELECT DISTINCT OrderID, CustomerID
FROM Sales;

INSERT INTO Products (ProductID, ProductName, Price)
SELECT DISTINCT ProductID, ProductName, Price
FROM Sales;

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
SELECT OrderID, ProductID, Quantity
FROM Sales;

-- Verify reconstructed sales records
SELECT O.OrderID, C.CustomerName, P.ProductName, D.Quantity, P.Price
FROM Orders AS O
JOIN Customers AS C ON O.CustomerID = C.CustomerID
JOIN OrderDetails AS D ON O.OrderID = D.OrderID
JOIN Products AS P ON D.ProductID = P.ProductID;

-- Verify table definitions
SHOW CREATE TABLE Customers;
SHOW CREATE TABLE Orders;
SHOW CREATE TABLE Products;
SHOW CREATE TABLE OrderDetails;
