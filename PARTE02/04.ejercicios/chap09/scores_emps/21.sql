SELECT empno, hiredate, ename,
  avg(sal) OVER
    (ORDER BY hiredate, empno ROWS BETWEEN
      unbounded PRECEDING and 1 PRECEDING )
    AS avgBefore,

  sal,

  avg(sal) OVER
    (ORDER BY hiredate, empno ROWS BETWEEN
      1 FOLLOWING and unbounded FOLLOWING )
    AS avgAfter
FROM emp
ORDER BY hiredate, empno ;
