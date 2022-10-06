/*12. In this question, you will explore the connection between number of wins and attendance. 
Does there appear to be any correlation between attendance at home games and number of wins? 
Do teams that win the world series see a boost in attendance the following year? 
What about teams that made the playoffs?
Making the playoffs means either being a division winner or a wild card winner.*/


SELECT year,
	   team,
	   games,
	   w, 
	   homegames.attendance,
	   CASE WHEN homegames.attendance > (SELECT AVG(homegames.attendance) FROM homegames) THEN 'above average'
	   WHEN homegames.attendance < (SELECT AVG(homegames.attendance) FROM homegames) THEN 'below average'
	   END AS hows_attend
FROM homegames
LEFT JOIN teams ON homegames.year = teams.yearid AND homegames.team = teams.teamid
WHERE games >10



 












