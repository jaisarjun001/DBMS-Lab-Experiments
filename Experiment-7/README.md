# Experiment 7: Database Normalization

## Aim
To identify functional dependencies in a denormalized Sales table and normalize it step-by-step from UNF to 3NF and BCNF. To verify lossless join and dependency preservation using SQL queries.

## Theory
Database normalization is the process of organizing data into multiple related tables to reduce data redundancy and avoid insertion, deletion, and update anomalies.

**Normal Forms:**
- **1NF:** Ensures that all attributes contain atomic values.
- **2NF:** Removes partial functional dependencies.
- **3NF:** Removes transitive dependencies.
- **BCNF:** Every determinant must be a candidate key.

## Procedure
1. Create the original denormalized Sales table.
2. Insert sample sales records.
3. Identify functional dependencies.
4. Create normalized tables: Customers, Orders, Products and OrderDetails.
5. Transfer data from the Sales table into normalized tables.
6. Use JOIN queries to reconstruct the original sales records.
7. Verify the table structures using SHOW CREATE TABLE.

## Tables Created
1. Sales
2. Customers
3. Orders
4. Products
5. OrderDetails

## Result
Successfully created normalized database tables and verified the reconstructed sales records using SQL JOIN queries.

## Conclusion
Database normalization helps reduce data redundancy, maintain data consistency and improve database organization.
