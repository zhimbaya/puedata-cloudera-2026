SELECT
  title_name,
  coalesce( pubdate, '**********') AS pubdate,
  coalesce( timestampdiff( year, pubdate, current_timestamp() ), '**') AS age
FROM titles 
ORDER BY pubdate ;
