-- Comprobar que no hay ningún
-- publisher en Los Angeles
SELECT * FROM publishers
  WHERE city = 'Los Angeles';

INSERT INTO publishers
  SELECT
      pub_id, pub_name, city, state, country
    FROM new_publishers
    WHERE city = 'Los Angeles';

SELECT * FROM publishers
  WHERE city = 'Los Angeles';
