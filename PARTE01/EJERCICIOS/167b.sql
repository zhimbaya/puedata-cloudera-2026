SELECT type
  FROM titles
  GROUP BY type
  HAVING
    MAX( sales ) >= 2*AVG(sales)
