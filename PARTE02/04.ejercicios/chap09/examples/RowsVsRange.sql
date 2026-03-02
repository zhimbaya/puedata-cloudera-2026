USE analyst ;

DROP VIEW IF EXISTS date_count ;

CREATE VIEW date_count AS
  SELECT to_date( posted ) AS this_date, COUNT( rating ) AS daily
  FROM ratings
  WHERE prod_id = 1274348
    AND to_date( posted ) NOT IN ( '2013-05-11', '2013-05-12', '2013-05-13' )
    AND to_date( posted ) > '2013-04-30'
  GROUP BY  to_date( posted ) ;

SELECT this_date, daily FROM date_count
ORDER BY this_date ;

SELECT
  this_date, daily,
  SUM( daily ) OVER( order by this_date RANGE between 1 preceding and current row ) range_sum,
  SUM( daily ) OVER( order by this_date ROWS between 1 preceding and current row ) rows_sum
FROM date_count ;
