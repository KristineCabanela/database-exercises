-- Subqueries-Exercises

show databases;
use employees;
describe employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT *
FROM employees
WHERE hire_date IN
(SELECT hire_date
FROM employees
WHERE emp_no = 101010);



-- 2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT title
FROM titles
WHERE emp_no IN
(SELECT emp_no
FROM employees
WHERE first_name = 'Aamod');

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT *
FROM employees
WHERE emp_no NOT IN (
SELECT emp_no
FROM salaries
WHERE to_date > CURDATE()
);



-- 4.  Find all the current department managers that are female. List their names in a comment in your code.

SELECT *
FROM employees
WHERE gender = 'F'
AND emp_no IN(
SELECT emp_no
FROM dept_manager
WHERE to_date > CURDATE()
);


-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.


SELECT *
FROM employees
WHERE 
SELECT emp_no
FROM salaries
WHERE salary >
FROM employees 
	(SELECT AVG(salary)
	FROM salaries)
AND to_date > currdate();

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

-- MAX SALARY
select max(salary) from salaries where to_date > now();


-- what is the 1 std for current salary?

select std(salary) from salaries where to_date > now();


select count(salary)
from salaries
where to_date > now()
and salary > (
(select max(salary) from salaries where to_date > now())
- (select std(salary) from salaries where to_date > now ())
);


SELECT salary, 
    (salary - (SELECT AVG(salary) FROM salaries)) 
    / 
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries;