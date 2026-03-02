SELECT
  empno, ename, deptno, sal,
  sal - MIN(sal) OVER (PARTITION BY deptno ORDER BY sal) AS diff_min
FROM emp ;
