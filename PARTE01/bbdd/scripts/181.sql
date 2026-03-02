SELECT title_id id, title_name name, t.pub_id, sales, avg_sales
FROM titles t
JOIN (
  SELECT pub_id, AVG(sales) AS 'avg_sales'
  FROM titles
  GROUP BY pub_id) t2
ON t.pub_id = t2.pub_id
WHERE sales >= avg_sales;
