SELECT
  empno, ename, deptno, sal,
  MIN(sal) OVER (PARTITION BY deptno ORDER BY sal) AS min_dept_sal
FROM emp ;

