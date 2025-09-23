-- 10) Creadores y número de juegos que tiene cada uno.
SELECT cre.nombre as creador
      ,count(jue.id_juego) as cnt_juegos
FROM videogame_2.creadores cre
left join videogame_2.juegos jue
  on jue.id_creador = cre.id_creador
group by cre.nombre ;

-- 11) Promedio de puntuación por juego (título y promedio).
select jue.titulo
      ,round(avg(res.puntuacion),2) as avg_puntuacion
from videogame_2.juegos jue
left join videogame_2.resenias res
on res.id_juego = jue.id_juego
group by jue.titulo
order by 2 desc ;

-- 12) Promedio de puntuación por género.
select jue.genero
      ,round(avg(res.puntuacion),2) as avg_puntuacion
from videogame_2.juegos jue
left join videogame_2.resenias res
on res.id_juego = jue.id_juego
group by jue.genero
order by 2 desc
;

-- 13) Juegos con promedio de puntuación >= 9.
select jue.titulo 
      ,round(avg(res.puntuacion),2) as avg_puntuacion
from videogame_2.juegos jue
left join videogame_2.resenias res
on res.id_juego = jue.id_juego
group by jue.titulo
having round(avg(res.puntuacion),2) >= 9
order by 2 desc
;

-- 14) Géneros con más de 1 juego registrado.
select jue.genero  
      ,count(*) as avg_puntuacion
from videogame_2.juegos jue
group by jue.genero
having count(*) > 1
;

-- 15) Juegos lanzados después de 2018 y su promedio de puntuación.
select jue.titulo 
      ,round(avg(res.puntuacion),2) as avg_puntuacion
from videogame_2.juegos jue
join videogame_2.resenias res
on res.id_juego = jue.id_juego
where jue.fecha_lanzamiento > '2018-12-31'
group by jue.titulo
order by round(avg(res.puntuacion),2) desc ;

-- 16) Creador con mayor cantidad de juegos (top 1).




