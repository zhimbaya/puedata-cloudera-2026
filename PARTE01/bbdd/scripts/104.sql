SELECT
    type,
    SUM(sales)   AS "sum",
    AVG(sales)   AS "avg",
    COUNT(sales) AS "count"
  FROM titles
  GROUP BY type;
