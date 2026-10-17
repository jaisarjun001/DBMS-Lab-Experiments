# Experiment 6: Stored Procedures and Triggers

## Aim
To create a stored procedure `transfer_employee(emp_id, new_dept_id)` with validation and error handling, implement triggers for salary validation and audit logging, and test edge cases.

## Theory
- **Stored Procedure:** A stored SQL program that performs a specific task and can be executed when required.
- **Triggers:** SQL statements that execute automatically when specified database events occur.
- **Validation:** Ensures that the entered data satisfies predefined rules.
- **Error Handling:** Handles invalid inputs and prevents incorrect operations.
- **Audit Logging:** Records changes made to database records for tracking and monitoring.

## Procedure
1. Create the required employee and department tables.
2. Create an audit table to store change records.
3. Implement the `transfer_employee(emp_id, new_dept_id)` stored procedure.
4. Add validation and error handling for employee and department IDs.
5. Create triggers for salary validation and audit logging.
6. Test employee department transfers and duplicate transfers.
7. Test invalid employee IDs, invalid department IDs, and invalid salaries.
8. Verify the audit records and error-handling results.

## Output
The output demonstrates employee department transfers, salary validation, audit logging, and error handling for invalid employee IDs, invalid department IDs, duplicate transfers, and invalid salaries.

Actual execution results are provided in the output screenshots.

## Result
The stored procedure, triggers, validation rules, and audit logging are implemented and tested according to the supported SQL environment.

## Files
- `queries.sql` — SQL source code for stored procedures, triggers, validation, and audit logging.
- `README.md` — Experiment aim, theory, procedure, output, and result.
- Output screenshots — Actual execution results.
