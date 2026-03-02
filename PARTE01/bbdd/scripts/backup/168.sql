SELECT type, round( AVG(sales), 2 ) AS avg
FROM titles
GROUP BY type
HAVING AVG(sales) >= (
  SELECT AVG(sales)
  FROM titles
  WHERE type = 'computer')
ORDER BY type ;
