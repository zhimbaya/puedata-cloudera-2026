SELECT title_id, title_name
  FROM titles
  WHERE type = (
    SELECT type
    FROM titles
    WHERE title_id = 'T20');
