-- Group By

SELECT distinct first_name
from employees

-- if we group by a column, we create group(s) for each column
-- And we can use aggregate functions on those groups
SELECT first_name
from employees
group by first_name;


-- if you see a "group by" think "for each" title make a row
-- for each title, show the count

-- what's the historic average salary of each department?
SELECT dept_no, avg(salary), min(salary), max(salary)
from salaries
join dept_emp using(emp_no)
group by dept_no;

-- "having" is like a where clause but for "group by"

SELECT first_name, count(first_name) as count_first_names
FROM employees
WHERE birth_date like '%-12-25'
and gender = 'F'
group by first_name
having count_first_names < 200;

