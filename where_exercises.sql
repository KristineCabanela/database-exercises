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
WHERE first_name = 'Irena' OR first_name =  'Vidya' OR first_name = 'Maya';

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



-- #### ORDER BY ####

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT *
FROM employees
WHERE first_name IN ('irena','vidya','maya')
ORDER BY first_name;

-- first person: first_name: Irena, last name: Reutenauer
-- last person: first name: Vidya, last name: Simmen


-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT *
FROM employees
WHERE first_name IN ('irena','vidya','maya')
ORDER BY first_name, last_name;

-- first person: first_name: Irena, last name: Acton
-- last person: first name: Vidya, last name: Zweizig

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT *
FROM employees
WHERE first_name IN ('irena','vidya','maya')
ORDER BY last_name, first_name;


-- first person: first_name: Irena, last name: Acton
-- last person: first name: Maya, last name: Zyda


--  5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

SELECT *
FROM employees
WHERE last_name LIKE 'e%'
ORDER BY emp_no DESC;

-- number of employees returned: 7330
-- first person: first_name: Ramzi, last name: Erde
-- last person: first name: Dharmaraja, last name: Ertl


-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.

SELECT *
FROM employees
WHERE last_name LIKE 'e%'
ORDER BY hire_date asc;

-- number of employees returned: 7330
-- newest employee: Phillip Eppinger
-- older employee: Cristinel Erdi

-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.

SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25'
ORDER BY birth_date desc, hire_date asc;

-- number of employees returned: 362
-- oldest employee who was hired last: Khun Bernini
-- youngest employee who was hired first: Douadi Pettis
