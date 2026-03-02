DROP VIEW IF EXISTS ranked  ;

CREATE VIEW ranked AS
  SELECT
    dense_RANK() OVER( ORDER BY hiredate ) AS rank,
    empno, hiredate, ename, sal
  FROM emp ;

SELECT rank, empno, hiredate, ename, sal FROM ranked ;

SELECT
  empno,
  hiredate,
  ename,
  sal,
  AVG(sal) OVER
    (ORDER BY RANK range BETWEEN 1 PRECEDING and 1 FOLLOWING )
    AS avg
FROM ranked ;
