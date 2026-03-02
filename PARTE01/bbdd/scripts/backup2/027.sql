SELECT title_name, sales, price
  FROM titles
  WHERE NOT (price < 20)
     AND (sales > 15000);

SELECT title_name, sales, price
  FROM titles
  WHERE NOT (price < 20)
     AND NOT (sales <= 15000);

