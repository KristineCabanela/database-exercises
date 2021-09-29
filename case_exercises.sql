-- Tuesday exercises on Case Statements


-- 1.  Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

USE employees;
select * from employees;
select * from dept_emp;
select * from departments;


SELECT dept_emp.dept_no, dept_emp.from_date, dept_emp.to_date,
	IF(to_date = '9999-01-01', 1, 0) AS is_current_employee
FROM dept_emp;



-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.


SELECT concat(first_name, ' ',last_name) as employee_name
CASE
WHEN last_name <'i' then 'a-h'
WHEN last_name <'r' then 'i-q'
ELSE 'R-Z'
END AS alpha_group
FROM employees;



SELECT
	CONCAT(first_name, ' ', last_name) AS employee_name,
	WHEN last_name LIKE 'a%' OR last_name LIKE 'b%' OR last_name LIKE 'c%%' OR last_name LIKE 'd%' OR last_name LIKE 'e%' OR last_name LIKE 'f%' OR last_name LIKE 'g%' OR last_name LIKE 'h%' THEN 'A-H'	CASE 
	WHEN last_name LIKE 'i%' OR last_name LIKE 'j%' OR last_name LIKE 'k%' OR last_name LIKE 'l%' OR last_name LIKE 'm%' OR last_name LIKE 'n%' OR last_name LIKE 'o%' OR last_name LIKE 'p%' OR last_name LIKE 'q%' THEN 'I-Q'
		ELSE 'R-Z'
	END AS alpha_group
FROM employees;


-- 3. How many employees (current or previous) were born in each decade?

SELECT * 
FROM employees
ORDER BY birth_date desc;

-- oldest: 1952-02-01
-- youngest: 1965-02-01

-- decades 50s, 60s

SELECT
	CASE(WHEN birth_date LIKE '195%' THEN birth_date ELSE NULL ELSE) as '50s'
	CASE(WHEN birth_date LIKE '196%' THEN birth_date ELSE NULL ELSE) as '60s'
FROM employees;
