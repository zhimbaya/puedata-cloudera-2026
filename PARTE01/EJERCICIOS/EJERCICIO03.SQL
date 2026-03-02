-- 05/02/2026
-- Joins
-- Cualificación de nombres de columnas

-- 115. Seleccionar autores que viven en una ciudad en la que también vive un editor
select authors.au_id, authors.city from authors
  join publishers on authors.city = publishers.city;
-- 116. Alternativa a la consulta anterior con clásula USING.
-- 117. Seleccionar titulo y nombre del editor para cada libro.  Utilizar las dos 
-- sintaxis: sin la clásula USING y con ella.
select title_name, pub_name from titles join publishers using(pub_id);
-- Creación de aliases de tabla mediante AS
-- 118. Seleccionar nombre y apellido de autores que vivan en una ciudad en la 
-- que también viva al menos un editor
select au_fname, au_lname, a.city from authors a join publishers p on a.city = p.city ;
-- 119. Por cada libro, seleccionar título y nombre del editor.  Utilizar alias de 
-- tablas para el JOIN
/*
Orden de ejecución de una sentencia sql:
1. FROM (incluye el JOIN)
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT / Window Functions
6. DISTINCT
7. UNION
8. ORDER BY
9. LIMIT
*/
-- 06/02/2026
-- joins con JOIN o WHERE
-- 120. Seleccionar nombre (au_fname), apellido (au_lname), y ciudad (au_lname)
-- de autores que vivan en una ciudad (city) en la que también viva al menos
-- un editor
SELECT AU_FNAME, AU_LNAME, a.CITY FROM authors a JOIN publishers p ON a.CITY = p.city;
SELECT au_fname, au_lname, a.city FROM authors a, publishers p WHERE a.city = p.city;
-- CROSS JOIN
-- 121. Muestra las columnas seleccionadas de todas las posibles combinaciones
-- de filas de las tablas authors y publishers.
SELECT au_id,pub_id,a.state AS "au_state",p.state AS "pub_state"
  FROM authors a
  CROSS JOIN publishers p
  ORDER BY au_id, pub_id;
-- INNER JOIN
-- 122. Junta dos tablas (authors y title_authors) mediante la columna au_id para
-- listar el title_id de los libros que escribió cada autor. La salida tiene que
-- estar ordenada por au_id y title_id.
SELECT a.au_id,a.au_fname,a.au_lname,ta.title_id
  FROM authors a
  JOIN title_authors ta
    ON a.au_id = ta.au_id
  ORDER BY a.au_id ASC, ta.title_id ASC;
-- 123. Similar al anterior pero ahora hay que mostrar el título del libro en vez
-- de su title_id.
SELECT a.au_id,a.au_fname,a.au_lname,ta.title_id,t.title_name
  FROM authors a
  JOIN title_authors ta
    ON a.au_id = ta.au_id
  JOIN titles t
    ON ta.title_id = t.title_id
  ORDER BY a.au_id ASC, ta.title_id ASC;
-- 124. Por cada libro, listar: 1) su title_id, 2) su title_name, 3) el pub_id del editor,
-- y 4) el pub_name del editor
SELECT T.TITLE_ID, T.TITLE_NAME, P.PUB_ID, P.PUB_NAME
FROM titles T
INNER JOIN publishers P
ON T.pub_id = P.pub_id;
-- 125. Listado de libros con sus autores, ordenados por tipo y título. En el
-- caso de múltiples autores, mostrar también el orden de los mismos.
SELECT * FROM titles;
SELECT title_name, type, au_fname , au_lname, au_order
  FROM titles T
  INNER JOIN title_authors TA
  ON T.title_id = TA.title_id
  INNER JOIN authors A
  ON TA.au_id = A.au_id
  ORDER BY type asc, title_name asc;
-- 126. Modificar la consulta anterior así: 1) no tiene que aparecer el tipo del
-- libro, 2) no tiene que aparecer el au_order, y 3) tiene que aparecer el
-- nombre del editor.
SELECT title_name, au_fname , au_lname,pub_name
  FROM titles T
  INNER JOIN title_authors TA
  ON T.title_id = TA.title_id
  INNER JOIN authors A
  ON TA.au_id = A.au_id
  INNER JOIN publishers P
  ON T.pub_id = P.pub_id;
-- 127. Combina un JOIN con condiciones WHERE para listar libros publicados en
-- el estado (state) de California (CA) o fuera de los países de Norte América
-- (USA, Canada, México)
SELECT title_id, title_name,state,country 
  FROM titles T  
  INNER JOIN publishers P 
  ON T.pub_id = P.pub_id 
  WHERE P.state = 'CA' OR P.country NOT IN ('USA', 'Canada', 'Mexico')
  ORDER BY title_id;
-- 128. Combina un INNER JOIN con la función agregada COUNT y una cláusula
-- GROUP BY para listar el número de libros que escribió (o coescribió) un
-- autor junto a su nombre y apellido. La salida tiene que estar ordenada
-- por número de libros (descendente) y por apellido (ascendente).
SELECT a.au_id, COUNT(*) AS "cnt",au_fname, au_lname
  FROM authors a
  JOIN title_authors ta
    ON a.au_id = ta.au_id
  GROUP BY a.au_id, a.au_fname, a.au_lname
  ORDER BY cnt DESC, au_lname 
  LIMIT 2;
-- NATURAL JOIN
-- 138 y 139
-- 138. Por cada libro (tabla titles) imprime el nombre (pub_name) de su editor
select title_id, pub_id, pub_name from titles natural join publishers pub_id;
-- 139. Mostrar autores que vivan en la misma ciudad y estado que algún publisher
-- (NATURAL JOIN con 2 columnas)
select au_id, pub_id, city , state from authors natural join publishers pub_id;
-- 140. Por cada libro, lista el nombre del editor (pub_name) y el adelanto (advance)
-- siempre que el adelanto sea inferior a 20.000. Tablas publishers,titles, y royalties.
select t.title_id, pub_id, pub_name , advance 
  from titles t 
  natural join publishers pub_id
  natural join royalties title_id
  where advance < 20000;
-- OUTER JOIN
-- LEFT, RIGHT, FULL
-- 142. LEFT OUTER JOIN para incluir a todos los autores en el resultado independientemente
-- de que haya un editor que viva en su misma ciudad.
select au_fname , au_lname , pub_name 
  from authors a
  left outer join publishers p
  on a.city = p.city
  order by pub_name asc;
-- 143. RIGHT OUTER JOIN para incluir a todos los editores en el resultado independientemente
-- de que haya un autor que viva en su misma ciudad
select au_fname , au_lname , pub_name 
  from authors a
  right outer join publishers p
  on a.city = p.city
  order by pub_name asc;
-- UNION
SELECT title_id, title_name FROM titles UNION SELECT city , state FROM authors;
-- 145. Simular el FULL OUTER JOIN anterior
SELECT a.au_fname, a.au_lname, p.pub_name FROM authors a
  LEFT OUTER JOIN publishers p ON a.city = p.city
UNION DISTINCT
SELECT a.au_fname, a.au_lname, p.pub_name FROM authors a
  RIGHT OUTER JOIN publishers p ON a.city = p.city 
ORDER BY pub_name ASC,au_lname ASC, au_fname ASC ;
-- 
select au_id, count(*) from titles
  right outer join authors
  on titles.title_id = authors.au_id
  group by au_id;
-- 09/02/2026


  











