UPDATE titles
  SET pubdate = '2004-04-04'
  WHERE title_id IN
    (SELECT title_id
      FROM title_authors
      WHERE au_id IN
        (SELECT au_id
           FROM authors
           WHERE au_fname = 'Sarah'
             AND au_lname = 'Buchman'));
