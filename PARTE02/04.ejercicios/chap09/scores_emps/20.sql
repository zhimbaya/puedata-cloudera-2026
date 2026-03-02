SELECT
  empno,
  hiredate,
  ename,
  sal,
  AVG(sal) OVER
    (ORDER BY hiredate, empno rows BETWEEN 1 PRECEDING and 1 FOLLOWING )
  AS avg
FROM emp ;

