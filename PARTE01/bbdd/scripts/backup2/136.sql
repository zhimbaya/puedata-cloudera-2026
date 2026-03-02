SELECT title_name AS title, type,
       au_fname, au_lname, au_order as ord
  FROM titles
  JOIN title_authors USING (title_id)
  JOIN authors USING (au_id)
  ORDER BY type, title_name, au_order;
