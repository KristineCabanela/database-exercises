-- FUNCTION NOTES

use employees;

-- CONCAT

SELECT lower(concat(first_name, last_name, "@codeup.com")) as email_address
from employees
where first_name not like '%georg%'
limit 10;

SELECT concat(substr(first_name, 1, 1), last_name, emp_no)
FROM employees;

-- SUBSTR
SELECT substr(first_name, 2, -1) from employees;


-- REPLACE
-- rebrand HR in a report
SELECT replace(dept_name, "Resources", "Solutions")
FROM departments;


-- DATE AND TIME FUNCTIONS

SELECT now();

-- The current date/time

SELECT curdate();

-- current date

SELECT CURTIME();

-- current time

SELECT unix_timestamp();

SELECT unix_timestamp(1971-01-01);

SELECT monthname("2022-01-01");

SELECT dayname("2022-01-01");
-- shows the day of the week for the date


-- NUMERICAL FUNCTIONS

SELECT avg(salary) from salaries;

SELECT max(salary) from salaries;

SELECT max(salary) - avg(salary) from salaries;
-- difference from max salary and average salary


