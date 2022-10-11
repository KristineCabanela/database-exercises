--for SQL TABLES exercises
-- Use the employees database, show sql query:
USE employees;

-- List all the tables in the Database
SHOW tables;

-- current_dept_emp, departments, dempt_emp, dept_emp_latest_date, dept_manager, employees, salaries, titles

-- What dataypes are in the employees table?
-- Numeric, unsigned, text, date

-- which table(s) do you think contain a numeric type column?
-- Salaries

-- Which table(s) do you think contain a string type column?
-- All Tables

-- Which table(s) do you think contain a date type column?
-- dept_emp, dept_manager, employees, salaries, titles

-- What is the relationship between the employees and the departments tables?
-- Schema.Table

-- show the SQL that created the dept_manager table.

show create table dept_manager;

-- CREATE TABLE `dept_manager` (
-- `emp_no` int NOT NULL,
-- `dept_no` char(4) NOT NULL,
-- `from_date` date NOT NULL,
-- `to_date` date NOT NULL,
-- PRIMARY KEY (`emp_no`,`dept_no`),
-- KEY `dept_no` (`dept_no`),
-- CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
-- CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

