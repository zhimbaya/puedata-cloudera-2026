UPDATE titles
  SET pubdate = '2003-01-01'
WHERE title_id IN (
  SELECT title_id
    FROM authors AS a
    JOIN title_authors AS ta USING( au_id )
    JOIN titles AS t USING( title_id )
    WHERE au_fname = 'Sarah' AND au_lname ='Buchman' ) 
