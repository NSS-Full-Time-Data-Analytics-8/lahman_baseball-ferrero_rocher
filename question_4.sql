/* 4. Using the fielding table, group players into three groups based on their position: 
label players with position OF as "Outfield", 
those with position "SS", "1B", "2B", and "3B" as "Infield", 
and those with position "P" or "C" as "Battery". 
Determine the number of putouts made by each of these three groups in 2016.*/

WITH outfielders AS (SELECT COUNT(po) AS outfield
	              FROM fielding 
                  WHERE pos = 'OF'
				  AND yearid = 2016),

 infielders AS (SELECT COUNT(po) AS infield
				 FROM fielding
				 WHERE (pos = 'SS'
				 OR pos = '1B'
				 OR pos = '2B')
			     AND yearid = 2016),
				 
 batteries AS (SELECT COUNT(po) AS battery
				FROM fielding
				WHERE (pos = 'P'
				OR pos = 'C')
				AND yearid = 2016),
 of_in AS (SELECT *
FROM outfielders
CROSS JOIN infielders)

SELECT outfield, infield, battery
FROM of_in 
CROSS JOIN batteries;


				

				










