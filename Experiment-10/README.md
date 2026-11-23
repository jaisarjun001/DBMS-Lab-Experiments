Experiment 10: SQL Query Optimization

Aim

To generate a dataset containing at least 10,000 rows, identify and analyze five slow SQL queries using EXPLAIN, optimize them using indexing and query rewriting, and compare query execution time before and after optimization.

Theory

SQL Query Optimization is the process of improving query performance by reducing execution time and database resource usage.

Indexing:
Indexes help retrieve records faster by reducing the amount of data scanned.

Types of Indexes Used:

Single Index: Created on one column.

Composite Index: Created on multiple columns.

EXPLAIN Command:
Used to analyze the query execution plan and understand how MySQL executes a query.

EXPLAIN ANALYZE:
Used to execute a query and display its actual execution plan and timing information (supported in MySQL 8.0.18+).

Procedure

Create the Sales table.

Generate 10,000 records using a stored procedure.

Verify the total number of records.

Analyze five SQL queries using EXPLAIN.

Create indexes on CustomerID, City, SaleDate and Amount.

Create a composite index on CustomerID and SaleDate.

Rewrite the date-based query for better optimization.

Compare query execution plans before and after optimization.

Use EXPLAIN ANALYZE to inspect actual execution performance.

Five Queries Analyzed

Search by CustomerID.

Search by City.

Search by SaleDate.

Search by Amount.

Search by CustomerID and SaleDate.

SQL Commands Used

CREATE TABLE

CREATE PROCEDURE

INSERT INTO

SELECT

CREATE INDEX

EXPLAIN

EXPLAIN ANALYZE

COUNT(*)

Result

Successfully generated 10,000 sales records, analyzed five SQL queries, and applied indexing and query rewriting techniques to study query optimization.

Conclusion

SQL query optimization improves database performance. Indexing, composite indexing and query rewriting help make data retrieval more efficient. EXPLAIN and EXPLAIN ANALYZE help evaluate query execution plans and performance.
