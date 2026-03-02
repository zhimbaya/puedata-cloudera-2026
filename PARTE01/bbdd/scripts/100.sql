SELECT
    COUNT(DISTINCT price) AS "count",
    SUM(DISTINCT price)   AS "sum",
    round( AVG(DISTINCT price), 2 )   AS "avg"
  FROM titles;
