SELECT *
FROM employees
WHERE last_name = 'herber'
AND gender = 'F';


SELECT *
FROM employees
WHERE last_name IN ('herber', 'Baek')
AND emp_no < 20000;

-- RETURN records where last name is either 'herber' or 'baek' OR first name is 'shridhar' and the employee number is less than 20000
SELECT *
FROM employees
WHERE last_name = 'herber' OR last_name = 'baek'
OR first_name = 'Shridhar' AND emp_no < 20000;

-- Parenthesis> NOT > AND > OR

SELECT (2 + 4) * 3;



--  Using 'is null'
USE curriculum_logs;

SELECT NULL=NULL

-- Select all records from logs where cohort_id is NULL (52893 records)
SELECT *
FROM logs
WHERE cohort_id IS NULL;


-- select all recrods from logs where cohort_id is not null and user_id = 40 (579 records)
SELECT *
FROM logs
WHERE cohort_id IS NOT NULL
AND user_id = 40;

-- using NOT
-- select all records where first name starts with 'eb' but does not end in 'e'

SELECT *
FROM employees
WHERE first_name LIKE 'eb%'
AND NOT first_name LIKE '%e'

-- order by
use employees;

SELECT first_name, last_name
FROM employees
WHERE gender = 'F'
ORDER BY last_name DESC;

-- 120051 rows


-- Return first_name and last_names for all employees ordered by last_name and then first_name (chaining)
SELECT first_name, last_name
FROM employees
WHERE gender = 'F'
ORDER BY last_name ASC, first_name DESC;


-- LIMIT AND offset
-- limits the number of results returned to a number you specify

-- SELECT columns from table limit count [offset count];

-- return 10 records for employees whose first name starts with M

SELECT * FROM employees
WHERE gender = 'M'
ORDER BY last_name
limit 5;

-- Adding an OFFSET tells MySQL which row to start retrieving data. e.g. offset 5 means skip first 5 rows.

SELECT * FROM employees
WHERE gender = 'M'
ORDER BY last_name
limit 5 OFFSET 10;

-- or

SELECT * FROM employees
WHERE gender = 'M'
ORDER BY last_name
limit 10,5;

-- Return 11th to 15th records for employees whose first_name starts with M when sorted in ascending order by first_name

