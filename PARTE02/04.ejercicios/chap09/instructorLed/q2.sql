-- 2. Which product is least expensive?

USE analyst;

SELECT brand, name, price
FROM products
WHERE price = (SELECT MIN (price) FROM products) ;



SELECT brand, name, price
FROM products
CROSS JOIN
  (SELECT MIN (price) AS m FROM products) sq
WHERE price = m ;



WITH sq AS (
  SELECT brand, name, price, MIN( price) OVER() AS m
  FROM products
)
SELECT brand, name, price
FROM sq
WHERE price = m ;



WITH sq AS (
  SELECT
    brand, name, price,
    rank() OVER( ORDER BY price ) AS rank
  FROM products
)
SELECT brand, name, price
FROM sq
WHERE sq.rank = 1 ;
