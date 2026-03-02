USE analyst ;

SELECT n, count(1) times
FROM
  (SELECT order_id, COUNT(*) n
   FROM order_details
   GROUP BY order_id ) x
GROUP BY n
ORDER BY n
