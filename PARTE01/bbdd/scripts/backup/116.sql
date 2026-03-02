SELECT au_id, authors.city
  FROM authors
  JOIN publishers
    ON authors.city = publishers.city;

