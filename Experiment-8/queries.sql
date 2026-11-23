
-- Experiment 8: Banking Transactions

-- Create Bank Account Table
CREATE TABLE Bank (
    AccountID INT PRIMARY KEY,
    Name VARCHAR(50),
    Balance DECIMAL(10,2)
);

INSERT INTO Bank VALUES
(101, 'Amit', 5000),
(102, 'Ravi', 3000);

-- 1. Transaction Using COMMIT
START TRANSACTION;

UPDATE Bank
SET Balance = Balance - 1000
WHERE AccountID = 101;

UPDATE Bank
SET Balance = Balance + 1000
WHERE AccountID = 102;

COMMIT;

-- 2. Transaction Using ROLLBACK
START TRANSACTION;

UPDATE Bank
SET Balance = Balance - 500
WHERE AccountID = 101;

ROLLBACK;

-- 3. Transaction Using SAVEPOINT
START TRANSACTION;

UPDATE Bank
SET Balance = Balance - 500
WHERE AccountID = 101;

SAVEPOINT S1;

UPDATE Bank
SET Balance = Balance + 500
WHERE AccountID = 102;

ROLLBACK TO SAVEPOINT S1;

COMMIT;

-- 4. Display Final Balances
SELECT * FROM Bank;

-- 5. Demonstrate Isolation Level
SET SESSION TRANSACTION ISOLATION LEVEL
READ COMMITTED;

START TRANSACTION;

SELECT * FROM Bank;

COMMIT;

-- 6. Demonstrate Concurrency
-- Execute in Session 1

START TRANSACTION;

UPDATE Bank
SET Balance = Balance - 100
WHERE AccountID = 101;

-- Execute in Session 2
SELECT * FROM Bank;

-- Return to Session 1
COMMIT;

-- Execute in Session 2 Again
SELECT * FROM Bank;
