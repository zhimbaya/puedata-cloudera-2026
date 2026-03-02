SELECT
  title_id,
  type,
  price
FROM
  titles
WHERE price > CASE
  when type = 'biography' then 20.0
  when type = 'children' then 15.0
  when type = 'computer' then 35.0
  when type = 'history' then 25.0
  when type = 'psychology' then 5.0
  end
ORDER BY type, price ;
