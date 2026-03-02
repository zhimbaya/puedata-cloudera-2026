SELECT SUM(
	CASE
		WHEN pubdate BETWEEN '2000-01-01' AND '2000-12-31' THEN sales
	  ELSE 0
	END ) AS "Total sales (2000 books)"
  FROM titles ;
