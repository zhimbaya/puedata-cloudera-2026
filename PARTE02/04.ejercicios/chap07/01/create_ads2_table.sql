USE analyst;

DROP TABLE IF EXISTS ads2;

CREATE EXTERNAL TABLE ads2 (
    campaign_id STRING,
    display_date STRING,
    display_time STRING,
    keyword STRING,
    display_site STRING,
    placement STRING,
    was_clicked TINYINT,
    cpc INT
  )
  PARTITIONED BY (network TINYINT)
  STORED AS
    parquet
  LOCATION
    '/analyst/dualcore/ads2'
  TBLPROPERTIES(
    'external.table.purge'='true' ) ;

