USE company_db;
SELECT
    e.emp_name,
    e.job_title,
    d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
SELECT
    e.emp_name AS employee_name,
    m.emp_name AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;
SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.salary > 50000;
SELECT
    d.dept_id,
    d.dept_name,
    COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
SELECT
    d.dept_id,
    d.dept_name,
    e.emp_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
