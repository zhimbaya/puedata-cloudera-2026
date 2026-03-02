SELECT
  concat_ws( '---',
    concat_ws( ':::',
      au_id,
      au_fname),
      au_lname ) AS info
FROM authors ;
