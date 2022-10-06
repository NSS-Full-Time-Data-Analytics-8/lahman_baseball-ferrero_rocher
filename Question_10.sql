SELECT teamid, yearid, hr, namefirst, namelast
FROM batting
INNER JOIN people
USING(playerid)
WHERE yearid > 2015 AND hr > 0

--

WITH players_10years AS(SELECT DISTINCT batting.yearid, batting.g, namefirst,namelast, hr
FROM people
INNER JOIN batting
USING(playerid)
WHERE batting.yearid > 2005 AND hr > 0),

max_homeruns AS (SELECT MAX(hr), namefirst, namelast
				FROM batting
				INNER JOIN people
				USING(playerid)
				GROUP BY namefirst,namelast
				HAVING MAX(hr) > 0)

SELECT DISTINCT namefirst, namelast, hr, yearid,
			   CASE WHEN yearid > 10 THEN '10'
			   ELSE '10' END AS years_adjusted
FROM players_10years
INNER JOIN max_homeruns
USING(hr)
WHERE yearid = 2016
GROUP BY namefirst, namelast, yearid, hr




