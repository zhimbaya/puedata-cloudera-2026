SELECT empno, hiredate, ename, sal,
  MAX(sal) OVER (ORDER BY hiredate) AS max
FROM emp ;

