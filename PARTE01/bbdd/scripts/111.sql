SELECT title_id
  FROM title_authors
  GROUP BY title_id
  HAVING COUNT(*) = 1;
