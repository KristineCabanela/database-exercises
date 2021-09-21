-- 1. Create a new SQL script named limit_exercises.sql.

-- 2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:

SELECT DISTINCT title FROM titles;

-- List the first 10 distinct last name sorted in descending order.

SELECT distinct last_name 
FROM employees
ORDER BY last_name desc
limit 10;

/*Zykh
Zyda
Zwicker
Zweizig
Zumaque
Zultner
Zucker
Zuberek
Zschoche
Zongker
*/

-- 3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.

SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5;

/* First 5 names of employees returned:
1. Alselm Cappello
2. Utz Mandell
3. Bouchung Schreiter
4. Baocai Kushner
5. Petter Stroustrup
*/

-- 4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.

SELECT *
FROM employees
limit 5 offset 45;

/*- Names of 10th page of results
1. Lucien Rosenbaum
2. Zvonko Nyanchama
3. Florian Syrotiuk
4. Basil Tramer
5. Yinghua Dredge


-- 5. LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
