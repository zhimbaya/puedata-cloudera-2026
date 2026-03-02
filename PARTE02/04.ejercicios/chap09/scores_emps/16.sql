SELECT empno, ename, deptno, sal,
  AVG(sal) OVER () AS avg_sal
FROM emp;

