DROP TABLE IF EXISTS partners3 ;

CREATE TABLE partners3
  STORED AS TEXTFILE AS
    SELECT
      id, fname, lname, email,
      regexp_extract( address, '([^,]*), ([^,]*), ([A-Z]{2})', 1 ) AS street,
      regexp_extract( address, '([^,]*), ([^,]*), ([A-Z]{2})', 2 ) AS city,
      regexp_extract( address, '([^,]*), ([^,]*), ([A-Z]{2})', 3 ) AS state
    FROM partners ;

SELECT
  fname, lname, street, city, state
FROM partners3  ;
