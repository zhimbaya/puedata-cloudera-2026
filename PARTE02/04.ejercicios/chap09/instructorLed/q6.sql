-- 6. What is the second lowest price? What is the fifth lower?

USE analyst ;

SELECT MIN( price ) AS 2nd_min
FROM products
WHERE price >
  ( SELECT MIN( price ) FROM products ) ;



SELECT DISTINCT price AS 5th_min
FROM products
ORDER BY price
LIMIT 1
OFFSET 4 ;



SELECT DISTINCT price AS 5th_min
FROM (
  SELECT price, dense_rank() OVER( ORDER BY price ) AS rnk
  FROM products
  ) sq
WHERE rnk = 5 ;
