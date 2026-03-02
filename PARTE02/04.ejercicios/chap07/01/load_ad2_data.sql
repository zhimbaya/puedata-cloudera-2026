USE analyst ;

INSERT OVERWRITE TABLE ads2
  PARTITION(network)
  SELECT
    campaign_id,
    display_date,
    display_time,
    keyword,
    display_site,
    placement,
    was_clicked,
    cpc,
    network
  FROM ads ;
