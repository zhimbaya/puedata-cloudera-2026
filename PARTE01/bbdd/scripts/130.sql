SELECT
    t.title_id,
    t.title_name,
    r.advance
  FROM royalties r
  JOIN titles t
    ON r.title_id = t.title_id
  WHERE t.type = 'biography'
  ORDER BY r.advance DESC;
