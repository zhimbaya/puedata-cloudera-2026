SELECT au_id, au_fname, au_lname, city
FROM authors
WHERE city IN (SELECT DISTINCT city FROM publishers);
