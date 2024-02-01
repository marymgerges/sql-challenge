-- Data Analysis 

-- Part 1
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" AS e
JOIN "Salaries" AS s
ON e.emp_no = s.emp_no;

-- Part 2
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- Part 3
-- List the manager of each department along with their department number,
-- department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM "Dept_Manager" AS dm
INNER JOIN "Departments" AS d
ON dm.dept_no = d.dept_no
INNER JOIN "Employees" AS e
ON dm.emp_no = e.emp_no;

-- Part 4
-- List the department number for each employee along with that
-- employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e
LEFT JOIN "Dept_Emp" AS de
ON e.emp_no = de.emp_no
INNER JOIN "Departments" AS d
ON de.dept_no = d.dept_no;

-- Part 5
-- List first name, last name, and sex of each employee whose first
-- name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM "Employees" AS e
WHERE (e.first_name = 'Hercules') AND (e.last_name LIKE 'B%');

-- Create table with up-to-date departments for employees.
SELECT DISTINCT ON (emp_no) *
INTO "Up_To_Date_Dept_Emp"
FROM "Dept_Emp";

-- Part 6
-- List each employee in the Sales department, including
-- their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e
INNER JOIN "Up_To_Date_Dept_Emp" AS utdde
ON e.emp_no = utdde.emp_no
INNER JOIN "Departments" AS d
ON utdde.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Part 7
-- List each employee in the Sales and Development departments, including
-- their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e
INNER JOIN "Up_To_Date_Dept_Emp" AS utdde
ON e.emp_no = utdde.emp_no
INNER JOIN "Departments" AS d
ON utdde.dept_no = d.dept_no
WHERE (d.dept_name = 'Sales')
OR (d.dept_name = 'Development');

-- Part 8
-- List the frequency counts, in descending order, of all the employee
-- last names (that is, how many employees share each last name)
SELECT last_name, count(last_name) AS frequency
FROM "Employees"
GROUP BY last_name
ORDER BY frequency DESC;