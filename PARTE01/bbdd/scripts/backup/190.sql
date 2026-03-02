SELECT title_name, type, price
FROM titles ;

UPDATE titles
  SET price = price * 2.0
  WHERE type = 'history';

SELECT title_name, type, price
FROM titles ;
