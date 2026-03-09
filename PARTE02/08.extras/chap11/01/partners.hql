DROP TABLE IF EXISTS partners;

CREATE TABLE partners (
  id INT,
  fname STRING,
  lname STRING,
  email STRING,
  address STRING
)
ROW FORMAT
  SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
TBLPROPERTIES( 'skip.header.line.count'='1') ;

!sh hdfs dfs -put -f partners.csv /tmp

LOAD DATA INPATH '/tmp/partners.csv' OVERWRITE INTO TABLE partners ;

SELECT id, fname, lname, email, address FROM partners ;
