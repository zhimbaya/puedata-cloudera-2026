USE analyst ;

SELECT COUNT( DISTINCT order_id ) two_or_more
FROM
  (SELECT order_id
    FROM order_details
    GROUP BY order_id, prod_id
    HAVING COUNT(*) > 1
  ORDER BY order_id) sq
