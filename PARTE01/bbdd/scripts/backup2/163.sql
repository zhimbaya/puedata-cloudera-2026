SELECT DISTINCT a.au_id, a.city
  FROM authors a
  JOIN publishers p
    ON a.city = p.city;
