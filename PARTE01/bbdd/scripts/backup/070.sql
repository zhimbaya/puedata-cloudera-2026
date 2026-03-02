SELECT title_name, pubdate,
  timestampdiff( year, pubdate, current_timestamp() ) AS age
FROM titles 
WHERE pubdate IS NOT NULL
ORDER BY pubdate ;
