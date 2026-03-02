WITH authorCounts as (
  SELECT
    dense_rank() OVER (ORDER BY cnt DESC) AS pos,
    a.au_id, COUNT(ta.title_id) AS "cnt",
    au_fname, au_lname
  FROM authors a
  JOIN title_authors ta
    ON a.au_id = ta.au_id
  GROUP BY a.au_id
 ) 

SELECT
  au_id, cnt, au_fname, au_lname
FROM authorCounts
WHERE pos = 1 ;
