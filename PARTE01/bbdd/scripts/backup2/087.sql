SELECT SUM(sales)
         AS "Total sales (2000 books)"
  FROM titles
  WHERE year( pubdate ) = 2000;
