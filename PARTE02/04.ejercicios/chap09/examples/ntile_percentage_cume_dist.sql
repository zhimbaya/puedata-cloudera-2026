use analyst ;

DROP TABLE IF EXISTS demo;

CREATE TABLE demo (
  value INT
);

INSERT INTO demo(value)
VALUES(0), (1), (1), (1), (1), (1), (1), (1), (9), (9);

SELECT * from demo ;

SELECT value,
  NTILE (3) OVER ( ORDER BY value ) ntile,
  RANK() OVER ( ORDER BY value ) rank,
  PERCENT_RANK() OVER ( ORDER BY value ) percent_rank,
  CUME_DIST() OVER ( ORDER BY value ) cume_dist
FROM demo ;
