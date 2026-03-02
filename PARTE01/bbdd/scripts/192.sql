SELECT a.au_fname, a.au_lname, t.title_name, t.pubdate
  FROM authors AS a
  JOIN title_authors AS ta USING( au_id )
  JOIN titles AS t USING( title_id )
  WHERE au_fname = 'Sarah' AND au_lname ='Buchman'
