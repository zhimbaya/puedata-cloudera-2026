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

shell hdfs dfs -put -f people.data /tmp/people.data ;

LOAD DATA INPATH '/tmp/people.data' OVERWRITE INTO TABLE people ;

SELECT * FROM people ;

ALTER TABLE people SET TBLPROPERTIES( 'skip.header.line.count'='1' );
SELECT * FROM people ;

ALTER TABLE people SET TBLPROPERTIES( 'skip.header.line.count'='3' );
SELECT * FROM people ;
