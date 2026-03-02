SELECT round( AVG(sales), 2) AS avg_sales
FROM titles ;

SELECT title_name, sales
FROM titles ;

UPDATE titles
  SET sales = sales * 0.5
  WHERE sales >
    (SELECT AVG(sales)
      FROM titles);

SELECT title_name, sales
FROM titles ;
