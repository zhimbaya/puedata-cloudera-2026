SELECT
    e.empno AS id,
    e.ename AS name,
    b.empno AS mgr_id,
    b.ename AS mgr_name
FROM emp e
LEFT OUTER JOIN emp b
  ON e.mgr = b.empno;
