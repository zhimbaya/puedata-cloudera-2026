USE analyst ;

SELECT name
FROM products
ORDER BY price
LIMIT 1 ;

---------

SELECT FIRST_VALUE(name) OVER( ORDER BY price ) AS name 
FROM products 
LIMIT 1
