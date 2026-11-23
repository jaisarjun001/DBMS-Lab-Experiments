# Experiment 8: Banking Transactions

## Aim
To implement banking-style transactions using BEGIN, COMMIT, ROLLBACK, and SAVEPOINT. To simulate partial transaction failures and demonstrate isolation levels and concurrency anomalies using two database sessions.

## Theory
Transaction management ensures data consistency and reliability in a database.

**Transaction Commands:**

- **BEGIN / START TRANSACTION:** Starts a new transaction.
- **COMMIT:** Permanently saves the changes.
- **ROLLBACK:** Cancels the changes made during a transaction.
- **SAVEPOINT:** Creates a point within a transaction to which we can roll back.

**Isolation Level:**
READ COMMITTED ensures that a transaction reads only committed data.

## Procedure
1. Create a Bank table with AccountID, Name and Balance.
2. Insert sample bank account records.
3. Perform money transfers using COMMIT.
4. Demonstrate ROLLBACK by cancelling a transaction.
5. Use SAVEPOINT to roll back partially within a transaction.
6. Display the final account balances.
7. Set the transaction isolation level to READ COMMITTED.
8. Demonstrate concurrency using two database sessions.

## SQL Commands Used
- CREATE TABLE
- INSERT INTO
- UPDATE
- START TRANSACTION
- COMMIT
- ROLLBACK
- SAVEPOINT
- ROLLBACK TO SAVEPOINT
- SELECT

## Result
Successfully implemented banking transactions using COMMIT, ROLLBACK and SAVEPOINT and demonstrated transaction isolation and concurrency using two database sessions.

## Conclusion
Transaction control commands help maintain database consistency and reliability by managing successful transactions, failures and concurrent database operations.
