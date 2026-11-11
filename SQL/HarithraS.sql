CREATE DATABASE company_db;

USE company_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
INSERT INTO departments (dept_id, dept_name, location)
VALUES
(1, 'HR', 'Chennai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Mumbai'),
(4, 'Marketing', 'Hyderabad'),
(5, 'Sales', 'Delhi'),
(6, 'Operations', 'Chennai'),
(7, 'Research', 'Bangalore'),
(8, 'Development', 'Pune'),
(9, 'QA', 'Hyderabad'),
(10, 'Customer Support', 'Delhi'),
(11, 'Sales', 'Chennai'),
(12, 'QA', 'Bangalore'),
(13, 'Legal', 'Mumbai'),
(14, 'Admin', 'Pune'),
(15, 'Logistics', 'Delhi'),
(16, 'Admin', 'Hyderabad'),
(17, 'HR', 'Chennai'),
(18, 'Training', 'Bangalore'),
(19, 'Sales', 'Mumbai'),
(20, 'RND', 'Pune');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    dept_id INT,
    joining_date DATE,

    FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
);
INSERT INTO employees
(emp_id, emp_name, age, salary, dept_id, joining_date)
VALUES
(101, 'Tara', 25, 30000, 1, '2023-01-15'),
(102, 'Priya', 28, 45000, 2, '2022-03-10'),
(103, 'Adhi', 30, 55000, 3, '2021-06-20'),
(104, 'Gita', 26, 35000, 4, '2023-07-12'),
(105, 'Subbu', 32, 60000, 5, '2020-11-05'),
(106, 'Sneha', 27, 40000, 6, '2022-08-18'),
(107, 'Shrreya', 29, 50000, 7, '2021-09-25'),
(108, 'Agan', 24, 28000, 8, '2024-01-10'),
(109, 'Jyo', 35, 70000, 9, '2019-04-15'),
(110, 'Mahu', 31, 52000, 10, '2020-12-20'),
(111, 'Ria', 26, 38000, 11, '2023-02-14'),
(112, 'Gops', 33, 65000, 12, '2019-08-30'),
(113, 'Natie', 28, 42000, 13, '2022-05-16'),
(114, 'Deepa', 29, 48000, 14, '2021-10-22'),
(115, 'Madhu', 34, 62000, 15, '2020-07-19'),
(116, 'Aishu', 25, 32000, 16, '2023-09-01'),
(117, 'Diya', 36, 75000, 17, '2018-03-25'),
(118, 'Mirun', 27, 41000, 18, '2022-11-11'),
(119, 'Thiru', 30, 57000, 19, '2021-01-05'),
(120, 'Kiran', 28, 46000, 20, '2022-06-08');

SELECT * FROM departments;
SELECT * FROM employees;

#DAY 2
SELECT *
FROM employees;

SELECT e.*
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales';

SELECT *
FROM employees
WHERE salary > 60000;

SELECT *
FROM employees
WHERE joining_date > '2020-01-01';

SELECT e.*
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales' OR d.dept_name = 'HR';  #IN ('Sales', 'HR');

#DAY 3
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 5;

SELECT *
FROM employees
ORDER BY emp_name ASC;

SELECT *
FROM employees
ORDER BY joining_date DESC
LIMIT 3;

#DAY 4
SELECT COUNT(*) AS total_employees
FROM employees;

SELECT AVG(salary) AS average_salary
FROM employees;

SELECT
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees;

SELECT SUM(salary) AS total_salary_expense
FROM employees;

#DAY 5
SELECT dept_id, COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id;

SELECT dept_id, AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id;

SELECT dept_id, COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 2;

SELECT dept_id, AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 60000;

#DAY 6
ALTER TABLE employees
ADD job_title VARCHAR(50);

UPDATE employees
SET job_title = CASE
    WHEN emp_id IN (101, 105) THEN 'Department Manager'
    WHEN emp_id % 3 = 0 THEN 'Senior Analyst'
    WHEN emp_id % 3 = 1 THEN 'Software Engineer'
    ELSE 'HR Executive'
END;

SELECT e.emp_name,
       e.job_title,
       d.dept_name
FROM employees AS e
INNER JOIN departments AS d
        ON e.dept_id = d.dept_id;


ALTER TABLE employees
ADD manager_id INT;

UPDATE employees
SET manager_id = CASE
    WHEN emp_id = 105 THEN NULL
    WHEN emp_id = 101 THEN 105
    ELSE 101
END;

SELECT e.emp_name     AS employee_name,
       m.emp_name     AS manager_name
FROM employees AS e
INNER JOIN employees AS m
        ON e.manager_id = m.emp_id;

SELECT * FROM Employees;


#DAY 7
SELECT d.dept_name,  #(including departments with no employees)
       COUNT(e.emp_id) AS employee_count
FROM departments AS d
LEFT JOIN employees AS e
       ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

SELECT e.emp_name,   #(including employees without a department)
       d.dept_name
FROM employees AS e
LEFT JOIN departments AS d
       ON e.dept_id = d.dept_id; 

SELECT e.emp_name, d.dept_name    #(FULL OUTER JOIN)
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;


#DAY 8
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT emp_name, salary
FROM employees e
WHERE salary > (SELECT m.salary
                FROM employees m
                WHERE m.emp_id = e.manager_id);

SELECT dept_name
FROM departments
WHERE dept_id IN (SELECT dept_id
                        FROM employees
                        GROUP BY dept_id
                        HAVING SUM(salary) > 200000);


#DAY 9
CREATE TABLE managers (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(100),
    job_title VARCHAR(50),
    dept_id INT
);

INSERT INTO managers
(manager_id, manager_name, job_title, dept_id)
SELECT DISTINCT
    m.emp_id,
    m.emp_name,
    m.job_title,
    m.dept_id
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

DROP table managers;

CREATE TABLE managers (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(100),
    job_title VARCHAR(50),
    dept_id INT
);

INSERT INTO managers
(manager_id, manager_name, job_title, dept_id)
SELECT DISTINCT
    m.emp_id,
    m.emp_name,
    m.job_title,
    m.dept_id
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

SELECT * FROM managers;

SELECT job_title FROM employees
UNION
SELECT job_title FROM managers;

SELECT dept_id FROM employees
INTERSECT
SELECT dept_id FROM managers;

#SELECT DISTINCT e.dept_id
#FROM employees e
#INNER JOIN managers m
        #ON e.dept_id = m.dept_id;



