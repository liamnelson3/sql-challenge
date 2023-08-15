-- --this table is used for testing, since the regular employees table is too large and causes a 
-- -- connection timeout when used (for my device at least)
-- create table employees_shortened 
-- as (select * from employees) 
-- with no data;

--1
SELECT e.emp_no, e.last_name, e.first_name, s.salary
FROM employees_shortened e
JOIN salaries s
ON (s.emp_no = e.emp_no);

--2
SELECT first_name, last_name, hire_date
FROM employees_shortened
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986'
ORDER BY hire_date ASC;

--3
SELECT m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
FROM dept_manager m 
JOIN departments d ON m.dept_no = d.dept_no
JOIN employees e ON e.emp_no = m.emp_no;

--4
SELECT last_name, COUNT(last_name) AS "Total"
FROM employees
GROUP BY last_name
ORDER BY "Total" DESC;

--5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees_shortened e
JOIN dept_emp p ON (p.emp_no = e.emp_no)
JOIN departments d ON (d.dept_no = p.dept_no)
WHERE d.dept_name = 'Sales'

--7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees_shortened e
JOIN dept_emp p ON (p.emp_no = e.emp_no)
JOIN departments d ON (d.dept_no = p.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--8
SELECT last_name, COUNT(last_name) AS "Total"
FROM employees
GROUP BY last_name
ORDER BY "Total" DESC;