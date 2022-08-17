-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.salary;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE (EXTRACT(year FROM hire_date)=1986);

-- 3. List the manager of each department with the following information:
    -- department number, -------------------- dept_manager
    -- department name, ---------------------- departments
    -- the manager's employee number, -------- dept_manager
    -- last name, first name. ---------------- employees

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
JOIN departments AS d
ON dm.dept_no = d.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, ---- employees
-- and department name. ----------------------- dept_employees (emp_no)

CREATE VIEW employees_department AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_employees AS de
ON de.emp_no = e.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex
-- for employees whose first name is "Hercules"
-- and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department,
-- including their employee number,
-- last name, first name,
-- and department name.

SELECT * FROM employees_department
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name,
-- and department name.

SELECT * FROM employees_department
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. List the frequency count of employee last names
-- (i.e., how many employees share each last name)
-- in descending order.

SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;