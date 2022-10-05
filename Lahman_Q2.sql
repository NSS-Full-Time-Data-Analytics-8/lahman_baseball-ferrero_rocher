SELECT DISTINCT namefirst, namelast, height, g_all AS games, teams.name AS team
FROM people
INNER JOIN appearances
USING(playerid)
INNER JOIN teams
USING(teamid)
ORDER BY height ASC
LIMIT 1;

