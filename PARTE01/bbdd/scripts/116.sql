SELECT au_id, city
  FROM authors
  JOIN publishers
  USING (city)
