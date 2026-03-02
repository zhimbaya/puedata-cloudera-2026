-- 5. Which product is the least expensive for each brand?

USE analyst;

SELECT p.brand, name, price
FROM products p
  JOIN (
    SELECT brand, MIN(price) as m
    FROM products
    GROUP BY brand
  ) sq
  ON p.brand = sq.brand
WHERE price = m
ORDER BY brand ;



SELECT brand, name, price
FROM (
  SELECT
    brand, name, price,
    price = MIN(price) OVER(PARTITION BY brand) AS is_min
  FROM products
) sq
WHERE is_min
ORDER BY brand ;



SELECT brand, name, price
FROM (
  SELECT
    brand, name, price,
    rank() OVER( PARTITION BY brand ORDER BY price) AS rank
    FROM products
) sq
WHERE rank = 1
ORDER BY brand ;
