SELECT pub_id, pub_name FROM publishers
WHERE pub_id IN (
  SELECT DISTINCT pub_id FROM titles
  WHERE type = 'biography');
