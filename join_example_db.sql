show databases;
USE join_example_db;


SELECT *
FROM users;

SELECT *
FROM roles;

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results


-- JOIN

SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;

-- LEFT JOIN

SELECT
	users.*,
	roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- RIGHT JOIN

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;


-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT roles.name AS role_name, COUNT(users.name) AS number_of_employees
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY role_name;






-- 1. Use the employees database.
show databases;

USE employees;



-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;


SELECT dept_name, CONCAT(first_name, ' ', last_name) AS 'current department manager'
FROM employees
JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
JOIN departments USING(dept_no)
WHERE to_date > CURDATE();



-- 3. Find the name of all departments currently managed by women.
SELECT dept_name, CONCAT(employees.first_name, ' ', employees.last_name) AS "current department manager", gender
FROM employees
JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
JOIN departments USING(dept_no)
WHERE to_date > CURDATE()
AND gender = 'F';


-- 4. Find the current titles of employees currently working in the Customer Service department.

SELECT title, COUNT(dept_emp.emp_no) as "#"
FROM dept_emp
JOIN titles 
ON dept_emp.emp_no = titles.emp_no
JOIN departments 
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Customer Service'
AND titles.to_date > CURDATE()
AND dept_emp.to_date > CURDATE()
GROUP BY titles.title;



-- 5. Find the current salary of all current managers.
SELECT dept_name, CONCAT(employees.first_name, ' ', employees.last_name) AS "current department manager", salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no
JOIN dept_manager 
ON dept_manager.emp_no = employees.emp_no
JOIN departments USING(dept_no)
WHERE salaries.to_date > CURDATE()
AND dept_manager.to_date > CURDATE();




-- 6.  Find the number of current employees in each department.
SELECT departments.dept_no, departments.dept_name, COUNT(emp_no) AS number_of_employees
FROM dept_emp
JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date > CURDATE()
GROUP BY dept_no, dept_name;


-- 7. Which department has the highest average salary? Hint: Use current not historic information.

SELECT dept_name, ROUND(AVG(salary), 2) AS average_salary
FROM dept_emp
JOIN salaries 
ON dept_emp.emp_no = salaries.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date > CURDATE()
AND salaries.to_date > CURDATE()
GROUP BY departments.dept_name
ORDER BY average_salary DESC
LIMIT 1;



-- 8. Who is the highest paid employee in the Marketing department?
SELECT employees.first_name, employees.last_name
FROM employees
JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
JOIN salaries
ON employees.emp_no = salaries.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Marketing'
AND dept_emp.to_date > CURDATE()
AND salaries.to_date > CURDATE()
ORDER BY salary DESC;


-- 9. Which current department manager has the highest salary?

SELECT employees.first_name, employees.last_name, salaries.salary, departments.dept_name
FROM employees
JOIN dept_manager 
ON employees.emp_no = dept_manager.emp_no
JOIN salaries 
ON employees.emp_no = salaries.emp_no
JOIN departments USING(dept_no)
WHERE dept_manager.to_date > CURDATE()
AND salaries.to_date > CURDATE();


