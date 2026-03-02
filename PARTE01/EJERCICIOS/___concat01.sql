SELECT
  concat_ws( ':::',
    au_id,
    au_fname) AS info,
    au_lname
FROM authors ;
