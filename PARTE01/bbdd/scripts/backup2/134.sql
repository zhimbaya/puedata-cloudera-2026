SELECT
    title_id,
    COUNT(title_id) AS "authors"
  FROM title_authors ta
  GROUP BY title_id
  HAVING COUNT(au_id) > 1
  ORDER BY title_id ASC;

