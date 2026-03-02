SELECT t.title_id id, t.title_name name, t.pub_id, sales
FROM titles t
WHERE sales >= (
  SELECT AVG(sales)
  FROM titles t2
  WHERE t.pub_id = t2.pub_id);
