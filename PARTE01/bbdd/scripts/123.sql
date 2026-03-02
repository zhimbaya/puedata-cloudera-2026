SELECT a.au_id, a.au_fname, a.au_lname, t.title_name
  FROM authors a
  JOIN title_authors ta
    ON a.au_id = ta.au_id
  JOIN titles t
    ON t.title_id = ta.title_id
  ORDER BY a.au_id ASC, ta.title_id ASC;

