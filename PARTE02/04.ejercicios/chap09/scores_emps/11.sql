SELECT
   name, test, score,
   lead(score) OVER (PARTITION BY test ORDER BY score DESC)
     AS next
FROM test_scores;

