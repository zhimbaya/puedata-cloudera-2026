SELECT title_id, title_name, type, sales
FROM titles
WHERE sales < ANY (
    SELECT sales
    FROM titles
    WHERE type = 'psychology')
  AND
    type <> 'psychology';

SELECT title_id, title_name, type, sales
FROM titles
WHERE sales < (
    SELECT MAX(sales)
    FROM titles
    WHERE type = 'psychology')
  AND
    type <> 'psychology';
