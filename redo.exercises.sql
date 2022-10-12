USE employees;


show databases;
use albums_db;

describe albums;

SELECT id from albums;

select count(*) from albums;

select distinct artist
from albums;


select count(distinct artist)
from albums;

select release_date from albums ORDER BY release_date ASC;


SELECT name FROM albums WHERE ARTIST = 'Pink Floyd';


select release_date from albums where name = "Sgt. Pepper's Lonely Hearts Club Band";

select genre from albums where name = 'Nevermind';

select name,release_date from albums where release_date >= 1990 and release_date <=1999;


select name,sales from albums where sales < 20;


select name,genre from albums where genre = 'Rock';

select name,genre from albums where genre like 'rock%' or genre like '%rock';

use employees;


select first_name from employees;

select first_name,last_name from employees where first_name in ('Vidya', 'Irena', 'Maya');

-- 709 employees with first name Vidya, Irena, Maya


select first_name,last_name from employees where first_name = 'Vidya' OR first_name = 'Irena' or first_name = 'Maya';

-- 709 employees


select first_name,last_name,gender from employees where gender = 'M' and first_name = 'Vidya' OR first_name = 'Irena' or first_name = 'Maya';

select first_name,last_name,gender from employees where gender = 'M' and (first_name = 'Vidya' OR first_name = 'Irena' or first_name = 'Maya');

-- 441 male employees

select last_name from employees where last_name like "e%";

-- 7330 employees

select last_name from employees where last_name like "%e" or last_name like "e%";

-- 30,723 that start or end with E


select last_name from employees where last_name like "%e" and last_name not like "e%";

-- 23,393 employees ends with E but does not start with E

select last_name from employees where last_name like "%e" and last_name like "e%";

-- 899

select last_name from employees where last_name like "%e";


select first_name, last_name,hire_date from employees where hire_date like '199%';


select first_name, last_name,birth_date from employees where birth_date like '%12-25';

select first_name, last_name,birth_date,hire_date from employees where hire_date like '199%' and birth_date like '%12-25';


select * from employees where last_name like '%q%';

select * from employees where last_name like '%q%' and last_name not like '%qu%';

SELECT first_name, last_name
FROM employees
GROUP BY first_name, last_name;


SELECT COUNT(first_name)
FROM employees;


SELECT COUNT(*) FROM employees;

select concat(first_name," ", last_name) as full_name from employees where last_name like "%e" and last_name like "e%"
group by full_name
order by full_name;


