-- EXPERIMENT 6
-- Stored Procedure, Validation, Triggers and Audit Logging

-- Reset objects so this script can be run from a clean or previous state.
DROP PROCEDURE IF EXISTS transfer_employee;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Salary_Audit;
DROP TABLE IF EXISTS Department;

-- STEP 1: Create the required tables
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Dept_ID INT,
    Salary DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Salary_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Emp_ID INT NOT NULL,
    Old_Salary DECIMAL(10,2),
    New_Salary DECIMAL(10,2),
    Change_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Action_Type VARCHAR(20)
);

-- Sample data for the procedure and trigger tests
INSERT INTO Department (Dept_ID, Dept_Name) VALUES
    (1, 'Sales'),
    (2, 'Engineering');

INSERT INTO Employee (Emp_ID, Emp_Name, Dept_ID, Salary) VALUES
    (1, 'Alice', 1, 60000.00),
    (2, 'Bob', 1, 50000.00);

-- STEP 2: Triggers for salary validation and audit logging
DELIMITER //

CREATE TRIGGER validate_salary_insert
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF NEW.Salary IS NULL OR NEW.Salary <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Salary must be greater than zero';
    END IF;
END//

CREATE TRIGGER validate_salary_update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.Salary IS NULL OR NEW.Salary <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Salary must be greater than zero';
    END IF;
END//

CREATE TRIGGER audit_salary_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF OLD.Salary <> NEW.Salary THEN
        INSERT INTO Salary_Audit
            (Emp_ID, Old_Salary, New_Salary, Action_Type)
        VALUES
            (OLD.Emp_ID, OLD.Salary, NEW.Salary, 'UPDATE');
    END IF;
END//

-- STEP 3: Stored procedure to transfer an employee
CREATE PROCEDURE transfer_employee(
    IN p_emp_id INT,
    IN p_new_dept_id INT
)
BEGIN
    DECLARE employee_count INT DEFAULT 0;
    DECLARE department_count INT DEFAULT 0;
    DECLARE current_dept_id INT DEFAULT NULL;

    SELECT COUNT(*), MAX(Dept_ID)
    INTO employee_count, current_dept_id
    FROM Employee
    WHERE Emp_ID = p_emp_id;

    IF employee_count = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Employee does not exist';
    END IF;

    SELECT COUNT(*)
    INTO department_count
    FROM Department
    WHERE Dept_ID = p_new_dept_id;

    IF department_count = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Department does not exist';
    END IF;

    IF current_dept_id = p_new_dept_id THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Employee already belongs to this department';
    END IF;

    UPDATE Employee
    SET Dept_ID = p_new_dept_id
    WHERE Emp_ID = p_emp_id;

    SELECT 'Employee transferred successfully' AS Result;
END//

DELIMITER ;

-- STEP 4: Test a valid transfer
CALL transfer_employee(2, 2);

-- STEP 5: Check the employee's department
SELECT Emp_ID, Emp_Name, Dept_ID
FROM Employee
WHERE Emp_ID = 2;

-- STEP 6: Test salary update and audit trigger
UPDATE Employee
SET Salary = Salary + 1000
WHERE Emp_ID = 2;

-- STEP 7: Display the audit log
SELECT * FROM Salary_Audit;

-- Test error cases separately by uncommenting one call at a time:
-- CALL transfer_employee(999, 2);
-- CALL transfer_employee(2, 999);
-- CALL transfer_employee(2, 2);
-- UPDATE Employee SET Salary = -500 WHERE Emp_ID = 2;
