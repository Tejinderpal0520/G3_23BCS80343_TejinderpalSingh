-- 23BCS80343 Tejinderpal Singh

-- QUE: Create a new database role named Analyst and grant this role SELECT access on the Employee_View.
-- Table Creation and insertion
CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2)
);

-- 23BCS80343 Tejinderpal Singh

INSERT INTO employee (emp_name, department, salary) VALUES
('Tejinder Singh', 'IT', 58000.00),
('Amit Sharma', 'HR', 45000.00),
('Rohit Verma', 'IT', 60000.00),
('Neha Kaur', 'Finance', 52000.00);

-- Creating view
CREATE VIEW Employee_View AS
SELECT emp_id, emp_name, department
FROM employee;

-- Creating role
CREATE ROLE Analyst
    LOGIN PASSWORD 'StrongPassword123';

-- 23BCS80343 Tejinderpal Singh

-- Grant and Revoke SELECT access to the role
GRANT SELECT ON Employee_View TO Analyst;

REVOKE SELECT ON Employee_View FROM Analyst;
