SELECT au_fname, au_lname, a.city
  FROM authors AS a
  JOIN publishers p
    ON a.city = p.city;

