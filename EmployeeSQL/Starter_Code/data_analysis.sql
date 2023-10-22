----1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp_no, last_name, first_name, sex, hire_date
FROM employees


---- 2.List the first name, last name, and hire date for the employees who were hired in 1986.

-- Change datatype for hire date column from varchar to date
ALTER TABLE employees ADD COLUMN new_hire_date date;

UPDATE employees SET new_hire_date = to_date(hire_date, 'MM/DD/YYYY');

ALTER TABLE employees DROP COLUMN hire_date;
ALTER TABLE employees RENAME COLUMN new_hire_date TO hire_date;

-- Select the data
SELECT 
	first_name, 
	last_name, 
	hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

---- 3. List the manager of each department along with their department number, 
----	department name, employee number, last name, and first name.

SELECT 
	d.dept_no AS "Department Number",
	d.dept_name AS "Department Name",
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name"
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no

---- 4. List the department number for each employee along with that employee’s employee number, 
----	last name, first name, and department name.

SELECT
	d.dept_no AS "Department Number",
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM dept_emp de
JOIN departments d ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no

---- 5. List first name, last name, and sex of each employee whose first name is Hercules 
----	and whose last name begins with the letter B.

SELECT 
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex AS "Sex"
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'


---- 6. List each employee in the Sales department, including their employee number, 
----	last name, and first name.

SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name"
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.dept_no = 'd007'

---- 7. List each employee in the Sales and Development departments, 
----	including their employee number, last name, first name, and department name.

SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

---- 8. List the frequency counts, in descending order, of all the 
----	employee last names (that is, how many employees share each last name).

SELECT 
	e.last_name AS "Last Name",
	COUNT(e.last_name) AS "Count"
FROM employees e
GROUP BY e.last_name
ORDER BY "Count" DESC
	


	




