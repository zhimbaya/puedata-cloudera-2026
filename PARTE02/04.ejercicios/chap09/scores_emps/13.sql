SELECT
   name, test,
   lag(score) OVER (PARTITION BY test ORDER BY score DESC)
     AS prev,
   score,
   lead(score) OVER (PARTITION BY test ORDER BY score DESC)
     AS next
FROM test_scores;

