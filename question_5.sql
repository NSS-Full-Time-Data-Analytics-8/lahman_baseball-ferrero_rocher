/*5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places.
Do the same for home runs per game. Do you see any trends?*/

SELECT ROUND(sum(so::decimal)/(sum(g)/2),2) AS avg_strikeout_per_game, 
ROUND(sum(HR::decimal)/(sum(g)/2),2) AS avg_homeruns_per_game,
CASE WHEN yearid >= 1920 AND yearid <=1929 THEN '1920s'
WHEN yearid >= 1930 AND yearid <=1939 THEN '1930s'
WHEN yearid >= 1940 AND yearid <=1949 THEN '1940s'
WHEN yearid >= 1950 AND yearid <=1959 THEN '1950s'
WHEN yearid >= 1960 AND yearid <=1969 THEN '1960s'
WHEN yearid >= 1970 AND yearid <=1979 THEN '1970s'
WHEN yearid >= 1980 AND yearid <=1989 THEN '1980s'
WHEN yearid >= 1990 AND yearid <=1999 THEN '1990s'
WHEN yearid >= 2000 AND yearid <=2009 THEN '2000s'
WHEN yearid >= 2010 AND yearid <=2019 THEN '2010s'
ELSE 'other' END as decade
FROM teams
WHERE yearid >= 1920
GROUP BY decade
ORDER BY decade ASC;



