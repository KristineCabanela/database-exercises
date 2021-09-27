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



-- 4. 