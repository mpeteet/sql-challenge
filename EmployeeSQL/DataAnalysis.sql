-- Analysis of the Employees database - Pewlett Hackard employees from 1980s to 1990s

-- List the employees
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no;

-- Who was hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE date_part('year',hire_date) = 1986
	ORDER BY hire_date;

-- List the department managers
SELECT dept_mgr.emp_no, dept_mgr.dept_no, departments.dep_name, employees.first_name, employees.last_name
FROM dept_mgr
INNER JOIN departments ON
dept_mgr.dept_no = departments.dept_no
INNER JOIN employees ON
dept_mgr.emp_no = employees.emp_no;

-- Which department does each employee belong to
SELECT departments.dep_name, employees.emp_no, employees.last_name, employees.first_name
FROM dept_emp
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no
LEFT JOIN employees ON
dept_emp.emp_no = employees.emp_no

-- Who are the Hercules B's?
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

-- Who works in the Sales department?
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dep_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
WHERE dep_name = 'Sales';

-- Who are the employees that work in the Sales or Development departments
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dep_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
WHERE dep_name = 'Sales' OR dep_name = 'Development';

-- How many employees share each last name (descending order)
SELECT last_name, COUNT(last_name) AS "last_names_count"
FROM employees
GROUP BY last_name
ORDER BY "last_names_count" DESC;


