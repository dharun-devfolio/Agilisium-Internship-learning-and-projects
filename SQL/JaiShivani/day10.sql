-- String Operations - CONCAT(), SUBSTRING(), UPPER(), LOWER(), TRIM(), LENGTH(), REPLACE()

-- Display employee names in upper case

SELECT UPPER(emp_name) AS Employee_Name 
FROM Employees; 

-- Extract the first 3 characters of each job title

SELECT job_title, SUBSTRING(job_title, 1, 3) AS Job
FROM Employees;

-- Remove spaces from department names
-- TRIM

SELECT department_name, TRIM(department_name) AS cleaned_name
FROM departments;

-- 1. CONCAT()

-- Display the employee name and job title together in a single column named employee_details.

SELECT CONCAT(emp_name, ' - ', job_title) AS Employees_name
FROM Employees; 

-- Display employee name, email and department ID together in one column named employee_information.

SELECT CONCAT(emp_name, ' - ',email, ' - ', department_id) AS Employee_Info
FROM Employees
ORDER BY department_id;

-- 2. SUBSTRING

-- Extract the first 3 characters of every employee's email address.

SELECT emp_name, email, SUBSTRING(email, 1,3) AS email_string
FROM Employees;

-- Extract the last 4 characters of every employee's email address.

SELECT emp_name, email, SUBSTRING(email, LEN(email) - 3, 4) AS email_string
FROM Employees;

-- 3. UPPER

-- Display all department names in uppercase along with their department IDs.

SELECT department_id, UPPER(department_name) AS dep_name
FROM departments;

-- 4. LOWER

-- Display employee names and job titles in lowercase.

SELECT LOWER(emp_name) AS name,
LOWER(job_title) AS Job
FROM Employees;

-- 5. LENGTH

-- Display each employee's name along with the number of characters in their name.

SELECT emp_name, LEN(emp_name) AS Name_length
FROM Employees;

-- 6. REPLACE

-- Replace the word Manager with Lead in every job title.

SELECT emp_name, job_title,
REPLACE(job_title, 'Manager', 'Lead') AS updated_job_title
FROM Employees;

-- Replace spaces in job title with underscores (_).

SELECT job_title, 
REPLACE(job_title, ' ', ' - ') AS updated_jobtitle
FROM Employees;