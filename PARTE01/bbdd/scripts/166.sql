SELECT title_id, title_name, type, sales
FROM titles
WHERE
  type = (SELECT type FROM titles WHERE title_id = 'T06')
  AND
  sales >= (SELECT sales FROM titles WHERE title_id = 'T04');
