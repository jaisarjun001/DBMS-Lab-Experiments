
-- Experiment 10: SQL Query Optimization

-- Use the database selected by the editor account.
-- Creating/selecting databases may be restricted in the sandbox.

-- Create Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Amount DECIMAL(10,2),
    SaleDate DATE,
    City VARCHAR(50)
);

-- Generate 10000 Records
DELIMITER //

CREATE PROCEDURE GenerateData()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10000 DO
        INSERT INTO Sales VALUES (
            i,
            i % 1000,
            i % 100,
            (i % 5000) + 100,
            DATE_ADD('2025-01-01',
                INTERVAL (i % 365) DAY),
            CASE
                WHEN i % 3 = 0 THEN 'Delhi'
                WHEN i % 3 = 1 THEN 'Mumbai'
                ELSE 'Kanpur'
            END
        );

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

CALL GenerateData();

-- Verify Number of Records
SELECT COUNT(*) FROM Sales;

-- QUERY 1: Search by CustomerID
-- Before Optimization
EXPLAIN
SELECT * FROM Sales
WHERE CustomerID = 105;

SELECT * FROM Sales
WHERE CustomerID = 105;

-- Optimization
CREATE INDEX idx_customer
ON Sales(CustomerID);

EXPLAIN
SELECT * FROM Sales
WHERE CustomerID = 105;

-- QUERY 2: Search by City
-- Before Optimization
EXPLAIN
SELECT * FROM Sales
WHERE City = 'Delhi';

-- Optimization
CREATE INDEX idx_city
ON Sales(City);

EXPLAIN
SELECT * FROM Sales
WHERE City = 'Delhi';

-- QUERY 3: Search by Date
-- Before Optimization
EXPLAIN
SELECT * FROM Sales
WHERE SaleDate = '2025-03-01';

-- Optimization
CREATE INDEX idx_date
ON Sales(SaleDate);

EXPLAIN
SELECT * FROM Sales
WHERE SaleDate = '2025-03-01';

-- QUERY 4: Search by Amount
-- Before Optimization
EXPLAIN
SELECT * FROM Sales
WHERE Amount > 3000;

-- Optimization
CREATE INDEX idx_amount
ON Sales(Amount);

EXPLAIN
SELECT * FROM Sales
WHERE Amount > 3000;

-- QUERY 5: Search by Customer and Date
-- Before Optimization
EXPLAIN
SELECT * FROM Sales
WHERE CustomerID = 105
AND SaleDate = '2025-03-01';

-- Optimization
CREATE INDEX idx_customer_date
ON Sales(CustomerID, SaleDate);

EXPLAIN
SELECT * FROM Sales
WHERE CustomerID = 105
AND SaleDate = '2025-03-01';

-- Query Rewriting Example
-- Original Query
SELECT * FROM Sales
WHERE YEAR(SaleDate) = 2025;

-- Optimized Query
SELECT * FROM Sales
WHERE SaleDate >= '2025-01-01'
AND SaleDate < '2026-01-01';

-- Compare Query Execution Time
-- Execute before and after optimization

-- Use EXPLAIN ANALYZE in MySQL 8.0.18+

EXPLAIN ANALYZE
SELECT * FROM Sales
WHERE CustomerID = 105;

EXPLAIN ANALYZE
SELECT * FROM Sales
WHERE CustomerID = 105
AND SaleDate = '2025-03-01';
