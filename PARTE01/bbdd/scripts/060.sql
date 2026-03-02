SET sql_mode := 'PIPES_AS_CONCAT';
SELECT
    lower(substring(au_fname, 1, 1)) ||
    upper( substring(au_fname, 2 ) ) AS nAME
  FROM authors
  WHERE au_fname IS NOT NULL AND au_fname <> '';
