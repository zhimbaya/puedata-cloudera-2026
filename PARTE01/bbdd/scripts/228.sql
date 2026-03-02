SELECT name, test, score,
  round( AVG(score) OVER (PARTITION BY name), 2 ) AS avgname
FROM test_scores;

