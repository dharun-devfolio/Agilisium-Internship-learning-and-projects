-- JOIN, INNER JOIN, with WHERE, with ORDER BY, SELF JOIN, Multiple-table JOIN

-- Employee name, job title, and department name using INNER JOIN

SELECT e.emp_name, e.job_title, d.department_name
FROM employees e
INNER JOIN departments d  -- Inner Join --> Returns only the rows that have matching values in both tables
ON e.department_id = d.department_id
ORDER BY d.department_name;

-- Employee with their manager name 

SELECT
    e.emp_id,
    e.emp_name,
    e.job_title,
    m.emp_name AS manger_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.emp_id
ORDER BY e.emp_id;


--------------------------------------------------------------------------------------------------------------------------

-- 1. INNER JOIN with SELECT 

-- Display employee names, job titles and department locations.

SELECT 
e.emp_name, e.job_title, d.location
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id;

-- Retrieve department names and the email addresses of employees working in them.

SELECT d.department_name, e.email
FROM departments d 
INNER JOIN employees e 
ON d.department_id = e.department_id;

-- 2. INNER JOIN + WHERE 

-- Find employees working in the Finance department.

SELECT e.emp_name, d.department_name
FROM employees e 
INNER JOIN departments d 
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

-- Find employees working on Floor 3.

SELECT e.emp_name, d.location
FROM employees e
INNER JOIN departments d 
ON e.department_id = d.department_id
WHERE d.location = '3rd Floor';

-- 3.   INNER JOIN + ORDER BY 

-- Sort employees by department name and then joining date (newest first).

SELECT e.emp_id, e.emp_name, 
d.department_name, e.join_date 
FROM employees e 
INNER JOIN departments d
ON e.department_id = d.department_id
ORDER BY d.department_name ASC, e.join_date DESC; 

-- 4. INNER JOIN with Multiple Conditions

-- Display employees whose department is in Floor 2 or Floor 3.

SELECT e.emp_name,d.department_name, d.location
FROM employees e
INNER JOIN departments d 
ON e.department_id = d.department_id
WHERE d.location = '2nd Floor' OR d.location ='3rd Floor';

-- Retrieve employees from the Sales department whose job title is 'Sales Executive'.

SELECT e.emp_id, e.emp_name, e.job_title, d.department_name
FROM employees e 
INNER JOIN departments d 
ON e.department_id = d.department_id
WHERE d.department_name = 'Sales'
  AND e.job_title = 'Sales Executive';

-- 5. JOIN

-- Find departments whose managers earn more than ₹70,000.

SELECT
    d.department_id,
    d.department_name,
    e.emp_name AS manager_name,
    e.job_title,
    e.salary
FROM departments d
INNER JOIN employees e
    ON d.manager_id = e.emp_id
WHERE e.job_title LIKE '%Manager%'
  AND e.salary > 70000;


