SELECT DISTINCT pub_name
  FROM publishers p
  JOIN titles t
    ON p.pub_id = t.pub_id
  WHERE t.type = 'biography';

