SELECT au_fname, au_lname, city, state
  FROM authors
  WHERE state = 'NY'
     OR state = 'CO'
     OR city = 'San Francisco';

SELECT au_fname, au_lname, city, state
  FROM authors
  WHERE state IN ('NY', 'CO') OR city = 'San Francisco';
