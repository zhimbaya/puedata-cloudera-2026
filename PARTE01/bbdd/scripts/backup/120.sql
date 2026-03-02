SELECT title_name, pub_name
  FROM titles t
  JOIN publishers p
    ON t.pub_id = p.pub_id;
