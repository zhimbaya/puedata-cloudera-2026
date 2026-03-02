DROP TABLE IF EXISTS people ;

CREATE EXTERNAL TABLE people (
    pcode STRING,
    lname STRING,
    fname STRING,
    age TINYINT
  )
  ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ':'
  STORED AS
    TEXTFILE
  LOCATION
    '/user/training/people' ;

ALTER TABLE people
  SET TBLPROPERTIES('external.table.purge'='true') ;

!sh hdfs dfs -put -f people.data /tmp/people.data

LOAD DATA INPATH '/tmp/people.data' OVERWRITE INTO TABLE people ;

SELECT pcode, lname, fname, age FROM people ;

INSERT INTO people VALUES
  ('82000','Martin','Odersky', 66),
  ('82134','Airth','Aiklaus','hola');

SELECT * FROM people ;
