SHOW databases;

-- Create a file named where_exercises.sql. Make sure to use the employees database.
USE employees;

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.

SELECT *
FROM employees
WHERE first_name IN ('irena','vidya','maya');

-- number of records = 709

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

SELECT *
FROM employees
WHERE first_name = 'irena' OR 'vidya' OR 'maya';

-- number of rows = 709

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.

SELECT *
FROM employees
WHERE first_name = 'irena' or first_name ='vidya' or first_name 'maya'
AND gender = 'M';

-- count 441


-- Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
SELECT *
FROM employees
WHERE last_name LIKE 'e%';

-- count 7330

-- Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?

SELECT *
FROM employees
WHERE last_name LIKE 'e%'
OR last_name LIKE '%e';

-- 30723 employees with a last name that starts or ends with e.

SELECT *
FROM employees
WHERE last_name LIKE '%e'
AND NOT last_name LIKE 'e%';
-- 23393 employees that ends with E but does NOT start with E


-- Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?

SELECT *
FROM employees
WHERE last_name LIKE 'e%'
AND last_name LIKE '%e';

-- 899 employees whose last name starts and ends with E.

SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%e';

-- 24292 employees whose last name ends with E, regardless of whether they start with E.


-- Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

SELECT *
FROM employees
WHERE hire_date LIKE '199%';

-- 135214 Employees


-- Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

SELECT birth_date
FROM employees
WHERE birth_date LIKE '%12-25';

-- 842 Employees born on Christmas

-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
SELECT hire_date, birth_date
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25';

-- 362 employees


-- Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

-- 1873 employees found

-- Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
SELECT *
FROM employees
WHERE last_name LIKE '%q'
AND NOT last_name LIKE 'Qu%';

-- 189 employees found
