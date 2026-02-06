-- CURSO DE SQL - EJERCICIOS 
select title_name , pubdate from titles where pubdate >= '2001-01-01';
-- 39. Listar autores que no viven en ninguno de estos estados: Nueva York (NY), New Jersey (NJ), o California (CA).
select * from authors where state not in('NY','NJ','CA');
-- 40. Listar libros que tengan un adelanto de 0, 1.000, o 5.000
select * from royalties where advance in (0,1000,5000); 
-- 41. Listar libros que se publicaron el primer día del año 2000, 2001, o 2002
select * from titles where pubdate in ('2000-01-01','2001-01-01','2002-01-01');
-- 42. Listar editores que viven en California
-- Comprobación de NULLs con IS NULL
select * from publishers where state = 'CA' and state is not null;
-- Operadores y funciones
-- Creacion de columnas derivadas
-- 47. Listar libros con un 10% de descuento
select title_id, title_name, price - (price * 0.10) as 'Descuento 10%' from titles;
-- 48. Listar adelantos de libros con un valor en negativo
select title_id, -advance as 'Advance' from royalties;
-- 49. Listar libros de biografías junto a la ganancia bruta (price*sales) que  han generado en orden descendiente
select title_id, price * sales as 'bruta' from titles order by bruta desc;
-- 50. Listar libros con el número de páginas divido por 10 como enteros y como decimales
select title_id, pages, pages div 10, truncate(pages/10,3), floor(pages/10.0), cast (pages/10.0 as integer)from titles;
-- CONCATENACIN CON 
-- 51. Listar autores con nombre y apellidos concatenados en una sola columna
set sql_mode = 'PIPES_AS_CONCAT';
select au_fname ||' '|| au_lname from authors;
-- 53. Listar biografías en orden descendente de fecha de publicación
select title_name ||' '|| pubdate from titles where type = 'biography' and pubdate is not null order by pubdate desc;
-- 54. Listar autores cuyo nombre y apellido sea Klee Hull
select au_id, au_fname, au_lname from authors where concat(au_fname,' ' ,au_lname) = 'Klee Hull' ;
select * from authors;
-- Extracción de subcadenas con substring (substr)
select substr('12345',0,2); -- ojo! la posicin Cero
-- 55. Dividir la clave primaria de los editores en parte alfabética y numérica
select substr(pub_id,1,1), substr(pub_id,2,2) from publishers;
-- 56. Listar la letra inicial del nombre junto con un `.´ y el apellido de los autores cuyo estado (state) sea  NY o CO
select concat(substr(au_fname,1,1),'. ', au_lname), state from authors where state in ('NY','CO');
-- 57. Listar autores cuyo teléfono empiece por 415
select au_fname, au_lname, phone from authors where substr(phone,1,3) = 415;
-- lower y upper
-- 58. Para cada autor, imprimir nombre en minúsculas y apellido en mayúsculas
-- 59. Imprimir nombre de libros que contengan MO independientemente de mayúculas y minúsculas
select * from titles where title_name like '%MO%';
-- 60. Imprimir el nombre de los autores con la primera letra en minúsculas y el resto en mayúsculas.
-- Si el nombre es NULL o su longitud es 0, no mostrar nada.
select au_id, concat(lower(substr(au_fname,1,1)),upper(substr(au_fname,2)) ) from authors where au_fname is not null and au_fname <> '';
-- Recortar caracteres con trim
select trim(LEADING from '    aaaa _ aa  ');
select trim(TRAILING from '    aaaa _ aa  ');
select trim(BOTH from '    aaaa _ aa  ');
-- 62. Listar apellido de los autores quitando la posible H mayúscula que esté al comienzo
select au_lname, trim(leading 'H' from au_lname) from authors;
-- 63. De la tabla titles, imprimir las columnas title_id que comiencen por T1 y 
-- tengan otro carácter ignorando los posibles espacios al comienzo y al final
select trim(title_id) from titles where substr(title_id,1,2) like 'T1%';
-- Longitud de cadenas con character_length (length)
-- SQL estándar: character_length
-- MariaDB acepta length
-- 64. Imprimir el nombre de los autores junto a su longitud
select au_fname, length(au_fname) from authors where au_fname <> '' and au_fname is not null;
-- 65. Listar el título de los libros junto con su longitud para aquellos libros 
-- cuya longitud sea inferior a 30.  El listado se tiene que ordenar por la 
-- longitud del título.
select title_name, length(title_name) as 'longitud' from titles where length(title_name) < 30 order by longitud asc;
-- Encontrar subcadenas con position (locate)
-- SQL estándar: position(substring IN string)
-- MariaDB acepta locate(substring, string)
-- 66. Listar la posición de la subcadena e en el nombre del autor y la posición 
-- de la subcadena ma en su apellido
select au_fname, au_lname, position('a' in au_fname), locate('ma',au_lname) from authors;
-- 67. Listar 1) los títulos que contengan la letra u entre sus 10 primeras posiciones 
-- y 2) la propia posición de la letra u.  La tabla resultante tiene 
-- que estar ordenada en orden descendente por la posición de la u.
select * from titles;
select title_name , locate('u', title_name) as 'posicion' from titles where position( 'u' in substr(title_name,1,10)) order by posicion desc;
-- Aritmética de Fechas
-- SQL estándar: extract([day|month|year] FROM pubdate)
-- MariaDB acepta:
-- year(pubdate)
-- month(pubdate)
-- day(pubdate)
-- 68. Imprimir libros que se hayan publicado en los primeros 6 meses de los 
-- años 2001 o 2002.  La salida tiene que estar ordenada por fecha descendente
select title_id,pubdate from titles where year(pubdate) in (2001,2002) and month(pubdate) between 1 and 6 order by pubdate desc;
-- 69. Imprimir libros, su fecha de publicación y los años que han pasado 
-- desde su fecha de publicación. No hay que mostrar los libros que tie
-- nen una fecha de publicación igual a NULL y la salida debe estar orde
-- nada por fecha de publicación.  (Hay que usar la funciones timestampdiff() y 
-- curdate() ).
select title_id,pubdate,timestampdiff(Year, pubdate, curdate()) from titles where pubdate is not null and pubdate <> '' order by pubdate asc;
-- Obtención de Fecha y Hora actuales
-- current_date
-- current_time
-- current_timestamp
-- 70. Imprimir 1) la fecha, 2) la hora, y 3) la fecha y hora actuales
select current_date, current_time, current_timestamp;
-- Información de usuarios con current_user
-- 71. Imprimir el nombre de usuario conectado a la BBDD
select current_user;
-- Evaluación de valores condicionales con CASE
-- 72. Incrementar el precio de los libros: los de historia en un 10%, los de 
-- psicología en en un 20%, y el resto dejarlo igual (versión SQL estándar)
select title_id, price, 
  case type
  when 'history' then (price * 1.10)
  when 'psychology' then (price * 1.20)
  else 'IGUAL'
  end as 'Incremento'
from titles WHERE PRICE <> '' AND PRICE IS NOT NULL ORDER BY PRICE ASC;
-- 73. Incrementar el precio de los libros: los de historia en un 10%, los de 
-- psicología en en un 20%, y el resto dejarlo igual (versión MariaDB)
select title_id, price, 
  case 
  when type = 'history' then (price * 1.10)
  when type = 'psychology' then (price * 1.20)
  else 'IGUAL'
  end as 'Incremento'
from titles WHERE PRICE <> '' AND PRICE IS NOT NULL ORDER BY PRICE ASC;
-- 74. Listar los libros con una categoría de ventas de tipo caracter dependiendo
-- del valor de la columna sales
select title_id , sales, 
case
  when sales <= 1000 then 'Less or equal to 1.000'
  when (sales > 1000 and sales <= 10000) then ' Between 1.001 and 10.000'
  when (sales > 10000 and sales <= 100000) then 'Between 10.001 and 100.000'
  when (sales > 100000 and sales <= 1000000) then 'Between 100.001 and 1.000.000'
  else 'Over 1.000.000'
end as 'Category'
from titles order by sales asc;
-- 75. Imprimir el nombre de los autores con la primera letra en minúsculas y 
-- el resto en mayúsculas.  Si el nombre es NULL o su longitud es 0, im
-- primir '**********'.  (Variación del ejercicio 060)
select au_id, 
  case 
  when au_fname is not null and au_fname <> '' then concat(lower(substr(au_fname,1,1)),upper(substr(au_fname,2)) )
  else '*******' 
  end as 'Nombre'
from authors ;
-- 76. Imprimir el title_id, type, y price de los libros que cumplan la condición siguiente:
/*
Condición:
• Si el tipo es 'biography' el precio tiene que ser superior a 20.0
• Si el tipo es 'children' el precio tiene que ser superior a 15.0
• Si el tipo es 'computer' el precio tiene que ser superior a  35.0
• Si el tipo es 'history' el precio tiene que ser superior a  25.0
• Si el tipo es 'psychology' el precio tiene que ser superior a  5.0
*/
select title_id, type, price
from titles 
where price > case
  when type = 'biography' then 20.0
  when type = 'children' then 15.0
  when type = 'computer' then 35.0 
  when type = 'history' then 25.0 
  when type = 'psychology' then 5.0 
  end 
order by type, price;

SELECT
  title_id,
  type,
  price
FROM titles
WHERE
  (type = 'biography' AND price > 20.0) OR
  (type = 'children' AND price > 15.0) OR
  (type = 'computer' AND price > 35.0) OR
  (type= 'history' AND price > 25.0) OR
  (type= 'psychology' AND price > 5.0)
ORDER BY type, price ;
-- Comprobación de NULLs con coalesce
-- 77. Lista la columna estado (state) de los editores.  Si el valor es NULL im
-- primir N/A
select pub_id,pub_name,state, 
  case
  when state is null then 'N/A'
  else state
  end as 'Condicion'
from publishers;
select pub_id,pub_name,coalesce(state,'N/A') from publishers;
-- 78. Imprimir libros, su fecha de publicación y los años que han pasado 
-- desde su fecha de publicación.  Si un libro tiene fecha de publicación 
-- NULL, hay que mostrar '******' en las columnas pubdate y age.   La salida 
-- debe estar ordenada por fecha de publicación.  (variación del ejercicio 69).
select title_name,
  case
  when pubdate is null  or pubdate = '' then '******'
  else timestampdiff(Year, pubdate, curdate())
  end as 'edad',
  case
  when pubdate is null  or pubdate = '' then '******'
  else pubdate
  end as 'Pubdate'
from titles order by pubdate asc;
select title_name,coalesce(pubdate,'****'),coalesce(timestampdiff(Year, pubdate, curdate()),'****') from titles order by pubdate asc;
-- Comprobación de NULLs con NULLIF
-- 79. Mostrar el valor de la columna contract de la tabla titles.  Si el valor 
-- es 0 hay que mostrat NULL

