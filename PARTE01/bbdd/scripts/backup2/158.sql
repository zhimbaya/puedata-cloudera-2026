SELECT e.ename, e.job, e.sal, s.grade
  FROM emp e
  JOIN salgrade s
    ON (e.sal BETWEEN s.losal AND s.hisal)
ORDER BY e.sal DESC;
