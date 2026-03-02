DROP TABLE IF EXISTS test_scores ;

CREATE TABLE test_scores (
  name STRING,
  test STRING,
  score TINYINT
) ;

INSERT INTO test_scores VALUES
  ('Steve', 'SQL', 75),
  ('Robert', 'SQL', 43),
  ('Tracy', 'SQL', 56),
  ('Tatiana', 'SQL', 87),
  ('Steve', 'Tuning', 83),
  ('Robert', 'Tuning', 31),
  ('Tracy', 'Tuning', 88),
  ('Tatiana', 'Tuning', 83) ;

SELECT * FROM test_scores ;
