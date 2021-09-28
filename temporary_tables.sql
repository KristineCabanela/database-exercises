-- Creating temporary tables- Monday afternoon exercises



-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

show databases;
use hopper_1559;

CREATE TEMPORARY TABLE hopper_1559.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

SELECT * FROM employees_with_departments;


-- A. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE employees_with_departments ADD full_name VARCHAR (35);

SELECT * FROM employees_with_departments;


-- B. Update the table so that full name column contains the correct data

UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

SELECT * FROM employees_with_departments;


-- C. Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name;

SELECT * FROM employees_with_departments;

ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT * FROM employees_with_departments;




-- 2. Create a temporary table based on the payment table from the sakila database.

show databases;
use hopper_1559;

CREATE TEMPORARY TABLE hopper_1559.payments_from_sakila AS 
SELECT *
FROM sakila.payment;

SELECT * FROM payments_from_sakila;


-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.


ALTER TABLE payments_from_sakila ADD column amount_in_cents INT UNSIGNED;

SELECT * FROM payments_from_sakila;

UPDATE payments_from_sakila
SET amount_in_cents = (amount * 100);

SELECT * FROM payments_from_sakila;


-- 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst? */


-- step 1 find historic average pay

use employees;
select avg(salary) from salaries;

-- 63810

-- step 2: find historic standard deviation

select stddev(salary) from salaries;

-- 16904


-- step 3: find current average pay in each department

select dept_name, avg(salary) as current_dept_salaries
from departments
join dept_emp using (dept_no)
join salaries using (emp_no)
group by dept_name;




CREATE TEMPORARY TABLE hopper_1559.salaries_by_dept
select dept_name, avg(salary) as current_dept_salaries
from departments
join dept_emp using (dept_no)
join salaries using (emp_no)
group by dept_name;


SELECT * FROM salaries_by_dept;



CREATE TEMPORARY TABLE hopper_1559.salaries_by_dept
SELECT dept_name, 
((AVG(salary) - (SELECT AVG(salary) 
FROM employees.salaries)) /
(SELECT std(salary)
FROM employees.salaries)) AS z_score
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
GROUP BY dept_name;

drop table salaries_by_dept;
SELECT * FROM salaries_by_dept;









