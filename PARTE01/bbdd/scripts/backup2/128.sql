SELECT
    a.au_id, COUNT(*) AS "cnt",
    au_fname, au_lname
  FROM authors a
  JOIN title_authors ta
    ON a.au_id = ta.au_id
  GROUP BY a.au_id, a.au_fname, a.au_lname
  ORDER BY cnt DESC, au_lname ;

