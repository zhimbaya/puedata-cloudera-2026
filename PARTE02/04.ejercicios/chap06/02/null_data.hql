DROP TABLE IF EXISTS people ;

CREATE EXTERNAL TABLE people (
    pcode STRING,
    lname STRING,
    fname STRING,
    age   TINYINT
  )
  ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ':'
  STORED AS
    textfile
  LOCATION
    '/user/training/people'
  TBLPROPERTIES(
    'external.table.purge'='true',
    'serialization.null.format'='' ) ;

!sh hdfs dfs -put -f people.data /tmp/people.data

LOAD DATA INPATH '/tmp/people.data' OVERWRITE INTO TABLE people ;

SELECT * FROM people p ;
