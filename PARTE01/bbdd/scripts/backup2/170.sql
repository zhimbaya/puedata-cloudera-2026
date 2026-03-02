# Sentencia errónea
SELECT title_id, title_name
FROM titles
WHERE sales = (
  SELECT AVG(sales)
  FROM titles
  GROUP BY type);
