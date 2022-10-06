/* 3. Find all players in the database who played at Vanderbilt University. 
Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. 
Sort this list in descending order by the total salary earned. 
Which Vanderbilt player earned the most money in the majors?

 ANSWER: DAVID PRICE */

WITH vandy_name AS (WITH vandy AS (Select *
FROM schools
JOIN collegeplaying USING(schoolid)
WHERE schoolname = 'Vanderbilt University')

SELECT *
FROM vandy 
INNER JOIN people USING(playerid))

SELECT distinct playerid, namefirst, namelast, schoolname, SUM(salary) AS total_salary
FROM vandy_name
INNER JOIN salaries USING(playerid)
GROUP BY playerid, namefirst, namelast, schoolname
ORDER BY total_salary DESC
LIMIT 1









