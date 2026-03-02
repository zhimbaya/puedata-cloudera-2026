SELECT empno, hiredate, ename,
  round(
    (avg(sal) OVER
      (order by hiredate, empno rows between unbounded preceding and 1 preceding ) ) , 2
    )
    AS avgBefore,

  sal,

  round(
    (avg(sal) OVER
      (order by hiredate, empno rows between 1 following and unbounded following ) ) , 2
    )
    AS avgAfter
FROM emp ;
