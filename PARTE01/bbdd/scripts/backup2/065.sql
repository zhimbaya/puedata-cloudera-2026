SELECT title_name,
       length(title_name) AS "Len"
  FROM titles
  WHERE length(title_name) < 30
  ORDER BY length(title_name) ASC;
