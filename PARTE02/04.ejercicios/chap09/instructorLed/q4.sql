-- 4. What is difference between a product's price and the minimum price for that brand?

USE analyst;

SELECT p.brand, name, price, m, price - m AS diff
FROM products p
JOIN (
  SELECT brand, MIN(price) as m
  FROM products
  GROUP BY brand
  ) a
ON p.brand = a.brand
ORDER BY brand, diff ;



SELECT brand, name, price,
	MIN(price) OVER(PARTITION BY brand) AS m,
	price - MIN(price) OVER(PARTITION BY brand) AS diff
FROM products
ORDER BY brand, diff ;
