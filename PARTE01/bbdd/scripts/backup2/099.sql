SELECT
    COUNT(price) AS "count price",
    SUM(price)   AS "sum price",
    AVG(price)   AS "avg price"
  FROM titles;
