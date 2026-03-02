SELECT empno, ename
FROM emp
WHERE
  emp.mgr = ( SELECT empno FROM emp WHERE mgr IS NULL )
  OR
  emp.mgr IS NULL
ORDER BY emp.mgr, emp.ename

