--Most wins with no wswin

SELECT name, w, l, wswin, yearid
FROM teams
WHERE yearid > 1969 AND wswin = 'N'
ORDER BY w DESC
LIMIT 1;

--least wins with wswin

SELECT name, g, w, l, wswin, yearid
FROM teams
WHERE yearid > 1969 AND wswin = 'Y' AND g >= 160
ORDER BY w ASC;

--WSwin % among teams with best record 

WITH teamwins AS (SELECT name, g, w, yearid, wswin,
MAX(w) OVER(PARTITION BY yearid)
FROM teams
WHERE yearid > 1969 AND g >= 160),

tw2 AS (SELECT *,
CASE WHEN w = max THEN 'yes' ELSE 'no' END AS wswin_bestrecord
FROM teamwins
WHERE wswin = 'Y')

SELECT ROUND((COUNT(*)*100.0/43),2)
FROM tw2
WHERE wswin_bestrecord = 'yes'

