SET sql_mode := 'PIPES_AS_CONCAT';

SELECT
  '<' || '  AAA  ' || '>'                     AS "Untrimmed",
  '<' || trim(LEADING FROM '  AAA  ') || '>'  AS "Leading",
  '<' || trim(TRAILING FROM '  AAA  ') || '>' AS "Trailing",
  '<' || trim('  AAA  ') || '>'               AS "Both" ;


