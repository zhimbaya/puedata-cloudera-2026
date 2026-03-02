CREATE VIEW IF NOT EXISTS ranked as
SELECT
  dense_rank() OVER( ORDER BY hiredate ) rank,
  empno, hiredate, ename, sal
FROM emp ;

SELECT * FROM ranked ;


SELECT
  empno,
  hiredate,
  ename,
  sal,
  round(
    AVG(sal) OVER
    (ORDER BY rank RANGE BETWEEN 1 PRECEDING And 1 FOLLOWING ), 2
  )
    AS avg
FROM ranked ;

