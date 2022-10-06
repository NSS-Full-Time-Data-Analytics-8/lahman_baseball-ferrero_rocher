/* #11. Is there any correlation between number of wins and team salary? Use data from 2000 and later to answer this question. 
As you do this analysis, keep in mind that salaries across the whole league tend to increase together, 
so you may want to look on a year-by-year basis.*/

--It appears that teams that have a higher salary tend to win more games but it is not garenteed 

WITH salary_per_team as (SELECT SUM(salary)::text::money AS salary_sum , teamid, yearid
					FROM salaries
					GROUP BY teamid, yearid
					ORDER BY yearid)
SELECT salary_sum, yearid, w, name
FROM salary_per_team
INNER JOIN teams USING (teamid, yearid)
WHERE yearid >= 2000
ORDER BY w DESC;

----  



