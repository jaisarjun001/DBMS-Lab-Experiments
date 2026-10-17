# Experiment 4: SQL Joins and Subqueries

## Aim
Using the Employee schema, write queries with INNER JOIN, LEFT JOIN, self join, 3-way join, correlated subqueries, EXISTS, simulated INTERSECT and EXCEPT. Compare execution plans using EXPLAIN.

## Theory
- **INNER JOIN:** Returns matching records from both tables.
- **LEFT JOIN:** Returns all records from the left table and matching records from the right table.
- **Self Join:** Joins a table with itself.
- **Three-Way Join:** Combines data from three tables.
- **Correlated Subquery:** A subquery that refers to the outer query.
- **EXISTS:** Checks whether a subquery returns any records.
- **Simulated INTERSECT:** Retrieves common records using conditions or subqueries.
- **Simulated EXCEPT:** Retrieves records present in one result set but not another.
- **EXPLAIN:** Displays the query execution plan.

## Procedure
1. Create the Department, Project and Employee tables.
2. Insert sample records into all three tables.
3. Execute INNER JOIN, LEFT JOIN, self join and three-way join queries.
4. Execute correlated subqueries and EXISTS queries.
5. Use subqueries to simulate INTERSECT and EXCEPT.
6. Compare query execution plans using EXPLAIN.

## Output
The queries display employee details with department and project information, matching and non-matching records, subquery results, and query execution plans.

Actual output screenshots are provided separately in this folder.

## Conclusion
This experiment demonstrates SQL joins, subqueries, set-operation alternatives and execution-plan analysis.
