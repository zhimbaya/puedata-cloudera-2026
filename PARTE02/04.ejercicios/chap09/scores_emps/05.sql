SELECT
  row_number() OVER (ORDER BY score DESC) AS pos,
  name, test, score
FROM test_scores;

