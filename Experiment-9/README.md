# Experiment 9: Railway Booking and SQL Query Optimization

## Aim
To create a Railway Booking table containing at least 5,000 records and benchmark query performance before and after creating single and composite indexes. To compare query execution plans using the EXPLAIN command.

## Theory
Indexing is a technique used to improve database query performance by allowing faster retrieval of records.

**Types of Indexes:**

- **Single Index:** An index created on one column.
- **Composite Index:** An index created on two or more columns.

**EXPLAIN Command:**

The EXPLAIN command is used to analyze the query execution plan and understand how the database retrieves records.

## Procedure
1. Create the RailwayBooking table.
2. Insert 5,000 records using a stored procedure.
3. Verify the total number of records using COUNT(*).
4. Execute a SELECT query before indexing.
5. Analyze the query using EXPLAIN.
6. Create a single index on TrainID.
7. Execute and analyze the query again.
8. Create a composite index on TrainID and JourneyDate.
9. Compare the query execution plans.
10. Display all indexes using SHOW INDEX.

## SQL Commands Used
- CREATE TABLE
- CREATE PROCEDURE
- INSERT INTO
- COUNT(*)
- CREATE INDEX
- EXPLAIN
- SELECT
- SHOW INDEX

## Result
Successfully created a RailwayBooking table containing 5,000 records and implemented single and composite indexes to analyze query execution plans.

## Conclusion
Indexes help improve database query performance by reducing the time required to retrieve records. The EXPLAIN command helps analyze query execution plans before and after indexing.
