SELECT empno, ename, deptno
FROM emp e
WHERE sal > (
  SELECT AVG(sal)
  FROM emp e2
  WHERE e.deptno = e2.deptno);
