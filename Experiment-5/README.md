# Experiment 5: SQL Views and Recursive CTE

## Aim
To create SQL views for department salary summary and employee hierarchy, test the updatability of views, and implement a recursive CTE to display reporting chains.

## Theory
- **Views:** Virtual tables based on SQL queries.
- **Aggregate Functions:** COUNT(), AVG(), MAX(), and MIN() summarize employee salaries.
- **LEFT JOIN:** Includes all departments, even those without matching employees.
- **View Updatability:** Tests whether data can be modified through a view or its underlying table.
- **Recursive CTE:** Uses a common table expression repeatedly to display hierarchical relationships.
- **Self-Referencing Foreign Key:** Connects an employee to their manager in the same table.

## Procedure
1. Create Department and Employee tables.
2. Insert department and employee records.
3. Create a department salary summary view.
4. Assign managers to employees.
5. Create an employee hierarchy view.
6. Update an employee's salary and verify the result.
7. Execute a recursive CTE to display the reporting chain.

## Output
The queries display department-wise salary summaries, employee-manager relationships, the updated salary, and employee reporting levels.

Actual execution screenshots should be uploaded separately.

## Conclusion
This experiment demonstrates SQL views, aggregate functions, view updatability, self-referencing relationships, and recursive CTEs.
