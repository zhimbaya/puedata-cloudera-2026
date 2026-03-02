-- 3. What is the price of the least expensive product in each brand?

USE analyst;

SELECT brand, MIN(price) AS m
FROM products
GROUP BY brand
ORDER BY brand;



SELECT DISTINCT brand, m
FROM (
  SELECT brand, MIN(price) OVER(PARTITION BY brand) m
  FROM products) sq
ORDER BY brand ;



SELECT DISTINCT brand, price
FROM (
  SELECT brand, price, rank() OVER(PARTITION BY brand ORDER BY price ) AS rank
  FROM products) sq
WHERE rank=1
ORDER BY brand;
