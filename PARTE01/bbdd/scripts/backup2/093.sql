SELECT title_id, sales
  FROM titles t1
  WHERE sales > (
    SELECT AVG(sales)
    FROM titles t2
    WHERE t1.type = t2.type
  )
  ORDER BY sales DESC;
