SELECT title_name, pub_name
  FROM titles
  JOIN publishers
  ON titles.pub_id = publishers.pub_id;

SELECT title_name, pub_name
  FROM titles
  JOIN publishers
  USING (pub_id);
