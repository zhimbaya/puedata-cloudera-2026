SELECT
   name, test,
   lag(score) OVER (PARTITION BY test ORDER BY score DESC)
     AS prev,
   score
FROM test_scores;

