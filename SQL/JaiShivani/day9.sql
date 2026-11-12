-- SET Operators --> UNION, UNION ALL, INTERSECT, EXCEPT


-- Create managers table 


CREATE TABLE Managers (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(100),
    email VARCHAR(100),
    department_id INT,
    job_title VARCHAR(100),

    FOREIGN KEY (manager_id)
        REFERENCES Employees(emp_id),

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);


INSERT INTO Managers (
    manager_id,
    manager_name,
    email,
    department_id,
    job_title
)
SELECT
    e.emp_id,
    e.emp_name,
    e.email,
    d.department_id,
    e.job_title
FROM Employees e
INNER JOIN Departments d
    ON e.emp_id = d.manager_id;

ALTER TABLE Managers
ADD salary DECIMAL(10,2);

UPDATE m
SET m.salary = e.salary
FROM Managers m
INNER JOIN Employees e
    ON m.manager_id = e.emp_id;

SELECT * FROM Managers;

-- Get list of all job titles from employees and managers table using UNION 

SELECT job_title
FROM Employees

UNION

SELECT job_title
FROM Managers;

-- Use INTERSECT to find common departments between two result sets

SELECT department_id
FROM Employees

INTERSECT

SELECT department_id
FROM Managers;

-- 1. UNION --> Combines the result of two SELECT statements and removes the duplicate rows.

-- Display all unique employee names and manager names in a single column called person_name.

SELECT DISTINCT emp_name AS person_name
FROM Employees

UNION

SELECT DISTINCT manager_name AS person_name
FROM Managers;

-- Combine employee names and manager names into one result, 
--displaying their names and identifying whether they are an Employee or Manager.

SELECT emp_name AS name , 'Employee' AS Role
FROM Employees

UNION 

SELECT emp_name AS name, 'Manager' AS Role
FROM Employees 
WHERE emp_id IN (
    SELECT DISTINCT manager_id FROM Employees
    WHERE manager_id IS NOT NULL);

-- 2. UNION ALL --> Combines the results of two SELECT statements without removing duplicate values

-- Display all department IDs from Employees and Managers, retaining duplicate values.

SELECT emp_name AS name, department_id
FROM Employees

UNION ALL 

SELECT manager_name AS name, department_id
FROM Managers;

-- 3. INTERSECT --> Returns only the records that exist in both SELECT statements.

-- Find job titles that exist in both Employees and Managers.

SELECT job_title FROM Employees

INTERSECT

SELECT job_title FROM Managers;

-- 4. EXCEPT --> Returns distinct records from first SELECT statement excluding the rows that are also present in the second SELECT statement.

-- Find employees' email addresses that are not present in Managers.

SELECT email FROM Employees

EXCEPT 

SELECT email FROM Managers;
