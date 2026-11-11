-- CREATE A DATABASE 

CREATE DATABASE company_db;

USE company_db;



-- Create Departments Table 

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(50),
    manager_id INT
);

-- Insert into department

INSERT INTO departments
(department_id, department_name, location, manager_id)
VALUES
(1, 'IT', '1st Floor', 101),
(2, 'HR', '2nd Floor', 105),
(3, 'Finance', '3rd Floor', 110),
(4, 'Sales', '4th Floor', 115);

-- CREATE Employees Table 

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department_id INT,
    join_date DATE,
    salary DECIMAL(10,2),
    job_title VARCHAR(100),
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);





-- Insert into Employees 

INSERT INTO employees
(emp_id, emp_name, email, department_id, join_date, salary, job_title)
VALUES

-- IT Department
(101, 'Arjun', 'arjun@company.com', 1, '2020-01-15', 85000, 'IT Manager'),
(102, 'Priya', 'priya@company.com', 1, '2021-03-20', 65000, 'Software Developer'),
(103, 'Rahul', 'rahul@company.com', 1, '2022-06-10', 55000, 'System Analyst'),
(104, 'Sneha', 'sneha@company.com', 1, '2023-02-18', 48000, 'Junior Developer'),
(106, 'Vikram', 'vikram@company.com', 1, '2021-08-12', 70000, 'Database Administrator'),

-- HR Department
(105, 'Divya', 'divya@company.com', 2, '2019-05-10', 80000, 'HR Manager'),
(107, 'Ananya', 'ananya@company.com', 2, '2020-09-22', 60000, 'HR Executive'),
(108, 'Karthik', 'karthik@company.com', 2, '2022-04-14', 45000, 'Recruiter'),
(109, 'Meera', 'meera@company.com', 2, '2023-01-05', 42000, 'HR Assistant'),
(111, 'Sanjay', 'sanjay@company.com', 2, '2021-11-17', 55000, 'Training Specialist'),

-- Finance Department
(110, 'Rohit', 'rohit@company.com', 3, '2018-07-20', 90000, 'Finance Manager'),
(112, 'Kavya', 'kavya@company.com', 3, '2020-03-15', 68000, 'Financial Analyst'),
(113, 'Ajay', 'ajay@company.com', 3, '2021-06-30', 58000, 'Accountant'),
(114, 'Pooja', 'pooja@company.com', 3, '2022-10-19', 50000, 'Junior Accountant'),
(116, 'Naveen', 'naveen@company.com', 3, '2023-05-21', 47000, 'Finance Executive'),

-- Sales Department
(115, 'Swathi', 'swathi@company.com', 4, '2019-04-11', 88000, 'Sales Manager'),
(117, 'Manoj', 'manoj@company.com', 4, '2020-08-08', 65000, 'Sales Executive'),
(118, 'Aishwarya', 'aishwarya@company.com', 4, '2021-12-19', 55000, 'Business Development Executive'),
(119, 'Praveen', 'praveen@company.com', 4, '2022-07-25', 48000, 'Sales Representative'),
(120, 'Harini', 'harini@company.com', 4, '2023-09-01', 45000, 'Junior Sales Executive');

-- Verify 

SELECT name
FROM sys.databases;

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- Display the rows 
SELECT * FROM departments;

SELECT * FROM employees; 

-- No of rows

SELECT COUNT(*) FROM departments;

SELECT COUNT(*) FROM employees;


ALTER TABLE Employees
ADD manager_id INT;

UPDATE Employees
SET manager_id =
    CASE
        WHEN job_title LIKE '%Manager%' THEN NULL
        WHEN department_id = 1 THEN 101
        WHEN department_id = 2 THEN 105
        WHEN department_id = 3 THEN 110
        WHEN department_id = 4 THEN 115
    END;