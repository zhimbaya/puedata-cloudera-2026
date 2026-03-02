SELECT title_name, au_fname, au_lname, pub_name
FROM titles
JOIN title_authors USING (title_id)
JOIN authors USING (au_id)
JOIN publishers USING (pub_id)
ORDER BY title_name;
