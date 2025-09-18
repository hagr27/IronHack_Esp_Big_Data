-- =========================================================
-- PRÁCTICAS DE SQL CON BASE DE DATOS DE VIDEOjuego
-- Tablas: creador, juego, resenia
-- =========================================================

-- =========================================================
-- 1. CONSULTAS BÁSICAS (WHERE, IN, LIKE, AND/OR, BETWEEN, ORDER BY)
-- =========================================================

-- 1.1 Selección simple
-- Enunciado: Lista todos los títulos de los juego.
select distinct titulo
from videogame.juego
order by titulo;

-- 1.2 WHERE con igualdad
-- Enunciado: Obtén los juego del género 'RPG'.
select titulo
      ,genero
from videogame.juego
where upper(genero) = 'RPG';

-- 1.3 WHERE con comparaciones de fecha
-- Enunciado: Muestra los juego lanzados a partir del 1 de enero de 2018.
select titulo
      ,fecha_lanzamiento 
from videogame.juego
where fecha_lanzamiento >= '2018-01-01';

-- 1.4 IN
-- Enunciado: Muestra los juego cuyo género sea 'RPG' o 'Aventura'.
select titulo
      ,genero 
      ,fecha_lanzamiento 
from videogame.juego
where genero;

-- 1.5 LIKE
-- Enunciado: Muestra las resenia cuyo comentario contenga la palabra 'obra'.
select *
from videogame.resenia
where lower(comentario) like '%obra%';



-- 1.6 AND / OR
-- Enunciado: Obtén los juego de género 'RPG' publicados después de 2020-01-01.
select *
from videogame.juego
where lower(genero) = 'rpg'
and fecha_lanzamiento > '2020-01-01';

-- 1.7 BETWEEN
-- Enunciado: Muestra los juego lanzados entre 2015 y 2019 (inclusive).
select *
from videogame.juego
where fecha_lanzamiento between '2015-01-01' and '2019-01-01';

-- 1.8 ORDER BY y LIMIT
-- Enunciado: Muestra los 3 juego más recientes por fecha de lanzamiento.
select *
from videogame.juego
where fecha_lanzamiento between '2015-01-01' and '2019-01-01';

-- =========================================================
-- 2. AGRUPACIONES (GROUP BY, HAVING)
-- =========================================================

-- 2.1 GROUP BY simple
-- Enunciado: Calcula la puntuación media de cada juego.
select jue.id_juego as id_titulo
      ,jue.titulo
      ,round( avg(res.puntuacion), 1) as  avg_puntuacion
      ,count(res.id_juego) as cnt_titulo
from videogame.resenia res
inner join juego jue
   on jue.id_juego = res.id_juego 
group by jue.id_juego
        ,jue.titulo
order by 3 desc;

-- 2.2 GROUP BY con WHERE
-- Enunciado: Muestra la puntuación media de los juego lanzados después de 2018.
select jue.id_juego as id_titulo
      ,jue.titulo
      ,round( avg(res.puntuacion), 1) as  avg_puntuacion
from videogame.resenia res
inner join juego jue
   on jue.id_juego = res.id_juego
where jue.fecha_lanzamiento >= '2018-01-01'
group by jue.id_juego
        ,jue.titulo
order by 3 desc;


-- 2.3 GROUP BY con HAVING
-- Enunciado: Muestra los juego con una puntuación media mayor o igual a 9.
select jue.id_juego as id_titulo
      ,jue.titulo
      ,round( avg(res.puntuacion), 1) as  avg_puntuacion
from videogame.resenia res
inner join juego jue
   on jue.id_juego = res.id_juego
group by jue.id_juego
        ,jue.titulo
having round( avg(res.puntuacion), 1) >= 9
order by 3 desc;


-- 2.4 GROUP BY con WHERE y HAVING
-- Enunciado: Calcula el promedio de puntuación de los juego de género 'RPG'
--            y muestra solo los que superen 8.5.


-- =========================================================
-- 3. JOINS
-- =========================================================

-- 3.1 INNER JOIN
-- Enunciado: Lista juego junto con el nombre de su creador.
select jue.id_juego as id_titulo
      ,jue.titulo
      ,cre.nombre
      ,jue.fecha_lanzamiento
from juego jue
join creador cre
on cre.id_creador = jue.id_creador
order by jue.fecha_lanzamiento ;

-- 3.2 LEFT JOIN
-- Enunciado: Muestra todos los creador y, si tienen juego, que aparezcan.
select cre.id_creador
      ,cre.nombre as creador
      ,jue.titulo as juego
      ,
from creador cre
left join juego jue
on jue.id_creador = cre.id_creador
order by jue.fecha_lanzamiento ;

SELECT setval(pg_get_serial_sequence('creador', 'id_creador'), max(id_creador)+1, false)
FROM creador;

-- 3.3 RIGHT JOIN
-- Enunciado: Muestra todos los juego y, si tienen resenia, que aparezcan.

-- 3.4 JOIN múltiple
-- Enunciado: Lista cada reseña mostrando título del juego y nombre del creador.


select * 
from videogame.resenia
where lower(comentario) like '%obra%'
   or lower(comentario) like ' obra%'
   or lower(comentario) like '%obra ';

SELECT *
FROM videogame.resenia
WHERE to_tsvector('spanish', comentario) @@ to_tsquery('spanish', 'obra');



