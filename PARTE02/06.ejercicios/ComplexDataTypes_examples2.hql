-- Hive only

-------------------------------------------------------------- Example: ARRAY
DROP TABLE IF EXISTS customers_phones;
CREATE TABLE customers_phones
  (cust_id STRING,
   name STRING,
   phones ARRAY<STRING>)
  ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    COLLECTION ITEMS TERMINATED BY '|'
  STORED AS TEXTFILE;

  -- Load data step not shown
!sh hdfs dfs -put data/customers_phones_array.csv /warehouse/tablespace/managed/hive/customers_phones

SELECT name, phones[0] AS phone0, phones[1] AS phone1
FROM customers_phones;


-------------------------------------------------------------- Example: MAP
DROP TABLE IF EXISTS customers_phones_map ;
CREATE TABLE customers_phones_map
  (cust_id STRING,
    name STRING,
    phones MAP<STRING,STRING>)
  ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    COLLECTION ITEMS TERMINATED BY '|'
    MAP KEYS TERMINATED BY ':'
  STORED AS TEXTFILE;

  -- Load data step not shown
!sh hdfs dfs -put data/customers_phones_map.csv /warehouse/tablespace/managed/hive/customers_phones_map

SELECT name, phones['home'] AS home
FROM customers_phones_map;


-------------------------------------------------------------- Example: STRUCT
DROP TABLE IF EXISTS customers_addr ;
CREATE TABLE customers_addr
  (cust_id STRING,
   name STRING,
   address STRUCT<street:STRING,
                   city:STRING,
                   state:STRING,
                   zipcode:STRING>)
  ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    COLLECTION ITEMS TERMINATED BY '|'
  STORED AS TEXTFILE;

  -- Load data step not shown
!sh hdfs dfs -put data/customers_addr.csv /warehouse/tablespace/managed/hive/customers_addr

SELECT name, address.state, address.zipcode
FROM customers_addr;


-------------------------------------------------------------- Example: Returning the Number of Items in a Collection
SELECT name, size(phones) AS num
FROM customers_phones;


-------------------------------------------------------------- Example: Converting ARRAY to Records with explode
SELECT explode(phones) AS phone
FROM customers_phones;


-------------------------------------------------------------- Example: Using explode with a Lateral View
SELECT name, phone
FROM customers_phones
  LATERAL VIEW
    explode(phones) p AS phone;


-------------------------------------------------------------- Example: Loading Data Containing Complex Types
DROP TABLE IF EXISTS cust_phones_parquet ;
CREATE TABLE cust_phones_parquet
  (cust_id STRING,
   name STRING,
   phones ARRAY<STRING>)
  STORED AS PARQUET;

INSERT INTO TABLE cust_phones_parquet
  SELECT * from customers_phones;


DROP TABLE IF EXISTS cust_addr_parquet ;
CREATE TABLE cust_addr_parquet
  STORED AS PARQUET
AS
  SELECT * FROM customers_addr;


DROP TABLE IF EXISTS cust_phones_map_parquet ;
CREATE TABLE cust_phones_map_parquet
  STORED AS PARQUET
AS
  SELECT * FROM customers_phones_map;
