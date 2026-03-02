SELECT empno, ename, deptno, sal,
  round( AVG(sal) OVER (), 2) AS avg_dept_sal
FROM emp;

