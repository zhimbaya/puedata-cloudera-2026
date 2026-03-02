SELECT title_id, title_name, type, sales
FROM titles
WHERE sales < ALL (
    SELECT sales
    FROM titles
    WHERE type = 'psychology');

SELECT title_id, title_name, type, sales
FROM titles
WHERE sales < (
  SELECT MIN(sales)
  FROM titles
  WHERE type = 'psychology')
