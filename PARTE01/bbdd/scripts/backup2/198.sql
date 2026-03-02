SELECT * FROM title_authors ORDER BY au_id;

DELETE FROM title_authors
  WHERE au_id IN 
    (SELECT au_id FROM authors
     WHERE au_lname = 'Hull');

-- SELECT * FROM title_authors ORDER BY au_id;

SELECT * FROM authors ORDER BY au_lname;

DELETE FROM authors
  WHERE au_lname = 'Hull';

-- SELECT * FROM authors ORDER BY au_lname;
