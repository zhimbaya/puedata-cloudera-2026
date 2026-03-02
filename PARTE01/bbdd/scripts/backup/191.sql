SELECT type, pages
  FROM titles ;

UPDATE titles
  SET type = 'self help',
      pages = NULL
  WHERE type = 'psychology';

SELECT type, pages
  FROM titles ;
