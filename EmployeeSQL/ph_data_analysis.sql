-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

-- checking rows affected for the employees table.
SELECT * FROM employees
		-- 300024 rows affected.

-- Q1 Answer:
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
	LEFT JOIN salaries AS s
	ON e.emp_no=s.emp_no;
		-- 300024 rows affected.

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

-- Q2 Answer:
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1-1-1986' AND '12-31-1986';
		-- 36150 rows affected

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT * FROM dept_manager;
		-- 24 rows 

-- Q3 Answer:
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
	LEFT JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
		LEFT JOIN employees AS e
		ON dm.emp_no = e.emp_no;

		-- 24 rows affected


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

-- employee number, last name, first name, and department name.

SELECT * FROM "dept_emp";
		-- 331603 rows affected.

-- Q4 Answer:
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM departments AS d
	LEFT JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
		LEFT JOIN employees AS e
		ON de.emp_no = e.emp_no;
		-- 331603 rows affected

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

-- Q5 Answer:
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
		-- 20 rows affected.
		
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT * FROM "departments"
SELECT * FROM "dept_emp";

SELECT *
FROM dept_emp
WHERE dept_no IN (
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
)
		-- 52245 rows affected.

-- Q6 Answer:
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		JOIN departments AS d
		ON de.dept_no = d.dept_no
		WHERE dept_name = 'Sales';
		-- 52245 rows affected.
		

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT *
FROM dept_emp
WHERE dept_no IN (
	SELECT dept_no
	FROM departments
	WHERE dept_name IN ('Sales','Development')
)
		-- 137952 rows affected.

-- Q7 Answer:
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		JOIN departments AS d
		ON de.dept_no = d.dept_no
		WHERE dept_name IN ('Sales','Development');
		-- 137952 rows affected.
		

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

-- Q8 Answer:
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
			-- 1638 rows affected.