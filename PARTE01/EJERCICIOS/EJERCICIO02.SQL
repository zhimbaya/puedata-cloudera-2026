-- Comprobación de NULLs con NULLIF
-- 79. Mostrar el valor de la columna contract de la tabla titles.  Si el valor 
-- es 0 hay que mostrat NULL
select title_id,nullif(contract,0) from titles;
-- Resumen y Agrupación de Datos
select count(*) from titles;
-- 80 ... 87
-- 80. Imprime el precio menor de los libros
select min(price) from titles;
-- 81. Imprime la fecha más antigua de publicación de un libro
select min(pubdate) from titles;
-- 82. De los libros de historia imprime el número de páginas de aquél que 
-- tiene el menor número
select title_name, type,min(pages) from titles where type = 'history';
-- Encontrar máximos con MAX
-- 83. Imprimir el menor precio de los libros, el mayor, y el rango de diferencia
select min(price) as mini, max(price) as maxi, maxi - mini from titles;
select min(price), max(price), (max(price) - min(price)) as 'diferencia' from titles;
-- 84. De los libros de historia imprimir el valor máximo de ganancia calculado
-- como price multiplicado por sales
select max(price * sales) from titles where type = 'history';
-- Cálculo de sumas con SUM
-- 85. Imprimir la suma de todos los adelantos pagados a los autores
-- Nota: Los adelantos están en la tabla Royalties.
select sum(advance) from royalties;
-- 86. Mostrar la suma de las ventas de todos los libros publicados en el año 
-- 2000 (no utilizar ninguna función en la cláusula WHERE).
select sum(sales) from titles where pubdate between '2000-01-01' and '2000-12-31';
-- 87. Mostrar la suma de las ventas de todos los libros publicados en el año 
-- 2000 (utilizando la función year en la cláusula WHERE).
select sum(sales) from titles where year(pubdate) = 2000;
-- 88. Mostrar la suma de las ventas de todos los libros publicados en el año 
-- 2000 sin usar una cláusula WHERE (hay que usar CASE dentro de SUM).
select sum(
  case
  when year(pubdate) = 2000 then sales
  end
) from titles;
-- 89. Mostrar la suma de 1) los precios, 2) las ventas, y 3) la ganancia (price 
-- *sale) de todos los libros
select sum(price), sum(sales), sum(price * sales) from titles;
-- Cálculo de medias con AVG
-- 90. Imprimir la media de los precios de los libros multiplicados por 2
select avg(price * 2) from titles;
-- 91. Imprimir la media y la suma de las ventas de libros de historia
select avg(sales), sum(sales) from titles where type = 'history';
-- 92. Imprimir los libros y sus ventas para todos aquellos libros cuyas ventas 
-- superen la media total (hay que usar una subconsulta).
select title_name, sales from titles where sales > (select avg(sales) from titles);
-- 93. Imprimir los libros y sus ventas para todos aquellos libros cuyas ventas 
-- superen la media de su categoría (type).
select title_name, sales from titles t1 
  where sales > (select avg(sales) from titles t2 where t1.type = t2.type);
select avg(sales), type from titles group by type;
-- 94. Imprimir las ventas medias de las biografías considerando los NULLs 
-- como 0 (usa la función coalesce).
select avg(coalesce(sales,0)) from titles where type = 'biography'; -- entre 4
select avg(sales) from titles where type = 'biography'; -- entre 3
-- Cálculo de número de filas con COUNT
-- 95. Imprimir la cuenta de los títulos de los libros, su precio, y la cantidad
select count(title_id), count(price), count(*) from titles;
-- 96. Imprimir la cuenta de los títulos de los libros, su precio, y la cantidad 
-- sin incluir libros cuyo precio es NULL
select count(title_id), count(price), count(*) from titles where price is not null and price <>'';
-- 97. Imprimir la cuenta de los títulos de los libros, su precio, y la cantidad 
-- para aquellos libros cuyo precio es NULL.
select count(title_id), count(price), count(*) from titles where price is null;
-- Suma de valores distintos con DISTINCT
-- 98. Imprimir el número total de libros de la tabla titles
select count(*) from titles;
select count(pub_id='P01') from titles; -- lo de dentro de count comprueba que no hay nulos
select pub_id='P01' from titles;  -- da true o false, 1/0
select count(sales is null) from titles; -- is null no produce un nulo
select count(sales or null) from titles;
select (sales is not null) from titles;
-- 99. Considerar los libros que no tienen NULL como precio e imprimir 1) el 
-- número de ellos, 2) la suma de sus precios, y 3) la media del precio.
select count(title_id), sum(price), avg(price) from titles where price is not null;
-- 100. Considerar los libros que no tienen NULL como precio e imprimir 1) el 
-- número de ellos, 2) la suma de sus precios, y 3) la media del precio.   Si 
-- un precio se repite, sólo se tiene que tomar en cuenta una sóla vez.
select count(*), sum(distinct(price)), avg(distinct(price)) from titles where price is not null;
select distinct(price) from titles;
-- select -> sin funciones agregadas y con funcioes agregadas
-- select -> funciones agregadas y utilizar el group by
-- 4) select 1)from 2)where 3)group by 5)order by
-- Primero group by crea las subtablas y luego se aplica el select sobre cada subtabla.

-- Agrupación de filas con GROUP BY
-- set sql_mode:='ONLY_FULL_GROUP_BY'
-- 101. Por cada autor, imprimir el número de libros que escribió incluyendo 
-- aquellos en los que es coautor
select au_id, count(*) from title_authors group by au_id;
-- 102. Ilustra la diferencia entre COUNT(state) y COUNT(*)
select state, count(state), count(*) from publishers group by state;
-- 103. Para tener resultados matemáticos consistentes, hay que usar 
-- COUNT(sales) en vez de COUNT(*)
select type,sum(sales)/count(sales), sum(sales)/count(*), avg(sales)from titles group by type;
-- 104. Por cada tipo de libro, calcular estadísticas de suma total de ventas, 
-- media, y número de libros
select type, sum(sales),avg (sales), count(sales) from titles group by type;
-- 105. Por cada tipo de libro, calcular las siguientes estadísticas: 1) ventas to
-- tales, 2) media de las ventas, y 3) número de libros.  El resultado tiene 
-- que estar ordenado por total de ventas.  Además, sólo se deben consi
-- derar aquellos libros cuyo precio sea igual o superior a 13.
set sql_mode:='ONLY_FULL_GROUP_BY';
select type, sum(sales) as 'total', avg(sales), count(sales) from titles where price >= 13 group by type order by total desc;
-- 106. Por cada editor y tipo de libro lista el número de libros ordenados de 
-- manera ascendente por editor y de manera descendente por número de libros
select pub_id,type, count(title_id) as 'n' from titles group by type,pub_id order by pub_id asc, n desc;
-- 107. Imprimir los distintos tipos de libros (versión 1: usando GROUP BY)
-- Nota: Hay que usar GROUP BY
select type from titles group by type;
select type from titles t1 where type = (select type from titles t2 where t2.type = t1.type) ;
-- 108. Imprimir los distintos tipos de libros  (versión 2: usando DISTINCT)
select distinct(type) from titles;
-- 109. Lista las ventas medias por cada uno de los precios ordenados por precio ascendente
select price, avg(sales) from titles where price is not null group by price order by price asc;
-- Filtrado de grupos con HAVING
-- 110. Lista el número de libros escritos por autor siempre que haya escrito más de 3 libros
select au_id, count(*) as 'n' from title_authors group by au_id having n >= 3;
-- 111. Listar el title_id de los libros que han sido escritos por sólo un autor.
select title_id from title_authors group by title_id having count(title_id )= 1;
-- 112. Por cada tipo de libro, imprime la cantidad de ellos y la media de ganacia 
-- bruta (price*sales) pero sólo para aquellos tipos cuya ganancia media 
-- sea superior a 1.000.000.   Hay que ignorar aquellos libros con precio nulo.
select type, count(price), avg(price * sales) as 'gmedia' from titles where price is not null group by type having gmedia > 1000000;
-- 113. Por cada editor, lista el número de libros de cada tipo, para editores con 
-- más de un libro por tipo.
select pub_id, type, count(pub_id) from titles group by type,pub_id having count(pub_id) >1;
-- 114. Para libros de los editores P03 y P04, listar el total de ventas y el precio 
-- medio por tipo, para tipos con más de 10.000 de ventas totales y menos 
-- de 20 de precio medio.
select type, sum(sales) as 's', avg(price)
  from titles where pub_id in ('P03','P04')
  group by type 
  having s > 10000 AND avg(price) < 20;




