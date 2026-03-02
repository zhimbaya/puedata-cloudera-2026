SELECT
    j1.empno, j1.deptno
    FROM jobhist j1
    JOIN jobhist j2
    ON
      j1.empno = j2.empno
      AND
      j1.deptno != j2.deptno
