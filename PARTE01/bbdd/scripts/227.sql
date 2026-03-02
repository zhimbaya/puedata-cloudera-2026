SELECT name, test, score,
  round( AVG(score) OVER (PARTITION BY test), 2 ) AS avgtest
FROM test_scores;
