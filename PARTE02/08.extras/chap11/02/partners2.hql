DROP TABLE IF EXISTS partners2;

CREATE TABLE partners2 (
  id     INT,
  fname  STRING,
  lname  STRING,
  email  STRING,
  street STRING,
  city   STRING,
  state  STRING
  )
  ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
  WITH SERDEPROPERTIES (
    "input.regex" =
    "(\\d+),([^,]*),([^,]*),([^,]*),\"([^,]*), ([^,]*), ([A-Z]{2})\""
    )
  STORED AS TEXTFILE
  TBLPROPERTIES( 'skip.header.line.count'='1') ;

!sh hdfs dfs -put -f partners2.csv /tmp

LOAD DATA INPATH '/tmp/partners2.csv' OVERWRITE INTO TABLE partners2 ;

SELECT fname, lname, street, city, state
FROM partners2  ;
