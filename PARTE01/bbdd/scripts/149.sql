SELECT
    e.empno AS id,
    e.ename AS name,
    b.empno AS mgr,
    b.ename AS mgr_name
FROM emp e
JOIN emp b
  ON e.mgr = b.empno;
