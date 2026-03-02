SELECT empno, ename, deptno, sal,
  round( AVG(sal) OVER (PARTITION BY deptno), 2) AS avg_dept_sal
FROM emp;

