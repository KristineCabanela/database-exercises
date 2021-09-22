show databases;
use employees;

-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

SELECT DISTINCT title
from titles;

-- 7 unique titles

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

SELECT DISTINCT concat(first_name, " ", last_name)
FROM employees
WHERE last_name like 'e%e'
GROUP BY last_name;


--- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

SELECT first_name, last_name
from employees
where 
group by first_name,last_name;

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT last_name
from employees
where last_name like '%q%'
and last_name not like 'qu%'
group by last_name;

-- 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

SELECT last_name, COUNT(*)
FROM employees
WHERE last_name like '%q%'
AND last_name not like 'qu%'
group by last_name;

-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT first_name, COUNT(*) AS count, gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY first_name;

-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?


SELECT lower(CONCAT(SUBSTR(first_name, 1,1), SUBSTR(last_name, 1,4), "_", SUBSTR(birth_date, 1,2), SUBSTR(birth_date, 3,2))) AS username, COUNT(*) as how_many
FROM employees
GROUP BY username
ORDER BY how many;


--  More practice with aggregate functions:

-- 9. Find the historic average salary for all employees. Now determine the current average salary.

SELECT AVG(salary)
from salaries
where to_date < curdate();

SELECT AVG(salary)
from salaries
where to_date > curdate();

-- 10. Now find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column.

SELECT emp_no, AVG(salary)
from salaries
where to_date < curdate()
group by emp_no;

-- 11. Find the current average salary for each employee.

SELECT emp_no, avg(salary)
from salaries
where to_date > curdate()
group by emp_no;

-- 12. Find the maximum salary for each current employee.

SELECT emp_no, max(salary)
from salaries
where to_date > curdate()
group by emp_no;

-- 13. Now find the max salary for each current employee where that max salary is greater than $150,000.

SELECT emp_no, max(salary) as max
from salaries
group by emp_no
having max > 150000;

-- 14. Find the current average salary for each employee where that average salary is between $80k and $90k.

SELECT emp_no, avg(salary) as average
from salaries
group by emp_no
having average between 80000 and 90000;