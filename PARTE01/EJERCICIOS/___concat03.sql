SELECT
  concat_ws( '---',
    concat_ws( ':::',
      au_id,
      CASE
        WHEN au_fname IS NULL THEN '********'
        WHEN length(au_fname) = 0 THEN '********'
        ELSE au_fname
      END),
      au_lname ) AS info
FROM authors ;
