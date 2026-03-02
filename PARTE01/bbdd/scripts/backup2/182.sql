SELECT e.empno, e.ename, e.deptno, e.sal, t2.avg_sal
FROM emp e
JOIN (
  SELECT deptno, AVG(sal) AS avg_sal
    FROM emp
    GROUP BY deptno) t2
ON (t2.deptno = e.deptno)
WHERE e.sal >= t2.avg_sal;
