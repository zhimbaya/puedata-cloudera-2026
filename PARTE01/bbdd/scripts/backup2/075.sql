SET sql_mode := 'PIPES_AS_CONCAT';
SELECT
   CASE
     WHEN au_fname IS NULL OR au_fname = ''
       THEN '*********'
     ELSE
       lower(substring(au_fname, 1, 1)) ||
       upper( substring(au_fname, 2 ) )
   END
     AS nAME
FROM authors;
