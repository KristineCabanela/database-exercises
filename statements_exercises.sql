-- Use the albums_db database.
SHOW databases;
USE albums_db;


-- Explore the structure of the albums table.
DESCRIBE albums;


-- a. How many rows are in the albums table?
SELECT id from albums;

SELECT *FROM albums;
--shows 31


-- How many unique artist names are in the albums table?
SELECT DISTINCT artist
FROM albums;


-- What is the primary key for the albums table?
SELECT * 
FROM albums 
WHERE id = 5;

-- What is the oldest release date for any album in the albums table? What is the most recent release date?
SELECT release_date
FROM albums;

-- Write queries to find the following information:

-- a. The name of all albums by Pink Floyd
SELECT name
FROM albums
WHERE name = "pink floyd";

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

-- c. The genre for the album Nevermind
SELECT genre
FROM albums
WHERE name = "nevermind";

-- d. Which albums were released in the 1990s
SELECT name
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;


-- e. Which albums had less than 20 million certified sales
SELECT name
FROM albums
WHERE "certified sales" < 20;

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT name
FROM albums
WHERE genre = "Rock";

SELECT name
FROM albums
WHERE genre like = "%Rock%"";

