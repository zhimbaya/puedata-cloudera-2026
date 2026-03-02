SELECT
  dense_rank() OVER (PARTITION BY test ORDER BY score DESC) AS pos,
  name, test, score
FROM test_scores;

