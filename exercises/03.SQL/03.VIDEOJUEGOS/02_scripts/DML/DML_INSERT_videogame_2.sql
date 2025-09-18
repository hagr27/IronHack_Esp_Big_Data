-- =========================================================
-- DATOS DE EJEMPLO "MÁS REALISTAS"
-- Objetivo: que haya variedad para practicar WHERE, JOIN, GROUP BY, HAVING,
-- subconsultas y UPDATE. Incluye:
-- - Varios juegos por creador
-- - Usuarios que reseñan varios juegos
-- - Algunos usuarios sin reseñas
-- - Juegos con muchas y con pocas reseñas
-- - Fechas distribuidas y puntuaciones variadas
-- Esquema esperado (simple, sin índices especiales):
--   Creadores(id_creador, nombre, tipo, pais, anio_fundacion)
--   Usuarios(id_usuario, nick, email, fecha_registro, pais)
--   Juegos(id_juego, titulo, fecha_lanzamiento, genero, id_creador)
--   Reseñas(id_resena, id_juego, id_usuario, puntuacion, comentario, fecha)
--   PremiosCreador(id_premio, id_creador, nombre_premio, categoria, anio, resultado)
-- =========================================================

-- Creadores
INSERT INTO videogame_2.creadores (id_creador, nombre, tipo, pais, anio_fundacion) VALUES
(1, 'Nintendo', 'estudio', 'Japón', 1889),
(2, 'FromSoftware', 'estudio', 'Japón', 1986),
(3, 'CD Projekt Red', 'estudio', 'Polonia', 2002),
(4, 'Rockstar Games', 'estudio', 'Estados Unidos', 1998),
(5, 'Kojima Productions', 'estudio', 'Japón', 2005);

-- Usuarios (12 usuarios: algunos muy activos, otros poco o nada)
INSERT INTO videogame_2.usuarios (id_usuario, nick, email, fecha_registro, pais) VALUES
(1,  'Carlos',   'carlos@example.com',   '2023-01-10', 'España'),
(2,  'Ana',      'ana@example.com',      '2023-01-12', 'España'),
(3,  'Pedro',    'pedro@example.com',    '2023-01-15', 'México'),
(4,  'Laura',    'laura@example.com',    '2023-02-01', 'Argentina'),
(5,  'Marta',    'marta@example.com',    '2023-02-05', 'España'),
(6,  'David',    'david@example.com',    '2023-02-18', 'Chile'),
(7,  'Lucia',    'lucia@example.com',    '2023-03-01', 'España'),
(8,  'Sofia',    'sofia@example.com',    '2023-03-10', 'Perú'),
(9,  'Rafa',     'rafa@example.com',     '2023-03-21', 'España'),
(10, 'Alvaro',   'alvaro@example.com',   '2023-04-02', 'España'),
(11, 'Noelia',   'noelia@example.com',   '2023-04-15', 'Colombia'),
(12, 'Hector',   'hector@example.com',   '2023-04-30', 'Uruguay');

-- Juegos (9 juegos, algunos del mismo creador)
INSERT INTO videogame_2.juegos (id_juego, titulo, fecha_lanzamiento, genero, id_creador) VALUES
(1, 'The Legend of Zelda: Breath of the Wild', '2017-03-03', 'Aventura', 1),
(2, 'Elden Ring',                               '2022-02-25', 'RPG',      2),
(3, 'The Witcher 3: Wild Hunt',                 '2015-05-19', 'RPG',      3),
(4, 'Grand Theft Auto V',                        '2013-09-17', 'Accion',   4),
(5, 'Red Dead Redemption 2',                     '2018-10-26', 'Accion',   4),
(6, 'Death Stranding',                           '2019-11-08', 'Aventura', 5),
(7, 'Cyberpunk 2077',                            '2020-12-10', 'RPG',      3),
(8, 'Super Mario Odyssey',                       '2017-10-27', 'Plataformas', 1),
(9, 'Sekiro: Shadows Die Twice',                 '2019-03-22', 'Accion',   2);

-- PremiosCreador (varios por creador y año, sin necesidad de ser "históricos exactos")
INSERT INTO videogame_2.premios_creador (id_premio, id_creador, nombre_premio, categoria, anio, resultado) VALUES
(1, 1, 'Best Action/Adventure', 'The Game Awards', 2017, 'ganador'),
(2, 1, 'Best Game Direction',   'The Game Awards', 2017, 'ganador'),
(3, 2, 'Game of the Year',      'The Game Awards', 2022, 'ganador'),
(4, 2, 'Best Game Direction',   'The Game Awards', 2019, 'ganador'),
(5, 3, 'Best RPG',              'The Game Awards', 2015, 'ganador'),
(6, 3, 'Excellence in Narrative','Global Awards',  2016, 'nominado'),
(7, 4, 'Best Audio Design',     'The Game Awards', 2018, 'ganador'),
(8, 4, 'Best Technology',       'Dev Choice',      2013, 'nominado'),
(9, 5, 'Best Art Direction',    'Global Awards',   2019, 'ganador');

-- Reseñas (40+ reseñas con múltiples por usuario y por juego)
-- Usuarios activos: Carlos(1), Ana(2), Pedro(3), Laura(4), Marta(5), David(6), Lucia(7), Sofia(8), Rafa(9), Alvaro(10)
-- Usuarios menos activos o sin reseñas: Noelia(11), Hector(12) (dejar alguno sin reseñar para ejercicios)
INSERT INTO videogame_2.resenias (id_resena, id_juego, id_usuario, puntuacion, comentario, fecha) VALUES
-- Zelda BOTW
(1,  1, 1, 10, 'Exploración brutal, libertad total.', '2023-09-10'),
(2,  1, 2,  9, 'Arte precioso y mundo vivo.',         '2023-09-11'),
(3,  1, 5,  9, 'Aventura inolvidable.',               '2023-09-12'),
(4,  1, 7,  8, 'Algo vacío en algunas zonas.',        '2023-09-13'),

-- Elden Ring
(5,  2, 3, 10, 'Desafiante y adictivo.',              '2023-09-14'),
(6,  2, 4,  9, 'Jefes memorables.',                   '2023-09-15'),
(7,  2, 6,  8, 'Curva de dificultad fuerte.',         '2023-09-16'),
(8,  2, 1,  9, 'Mundo abierto muy bien hecho.',       '2023-09-17'),
(9,  2, 10, 7, 'Me costó entrar, luego me encantó.',  '2023-09-18'),

-- The Witcher 3
(10, 3, 5,  9, 'Historia y personajes top.',          '2023-09-19'),
(11, 3, 6,  8, 'Muchas secundarias, a veces relleno.', '2023-09-20'),
(12, 3, 2, 10, 'Misiones increíbles.',                 '2023-09-21'),
(13, 3, 9,  9, 'Ambientación única.',                  '2023-09-22'),
(14, 3, 1,  9, 'Sistema de decisiones profundo.',      '2023-09-23'),

-- GTA V
(15, 4, 7, 10, 'Diversión infinita con amigos.',       '2023-09-24'),
(16, 4, 1,  9, 'Mapa enorme y vivo.',                  '2023-09-25'),
(17, 4, 8,  8, 'Online puede ser caótico.',            '2023-09-26'),
(18, 4, 9,  9, 'Gran sandbox criminal.',               '2023-09-27'),

-- RDR2
(19, 5, 3, 10, 'Narrativa y detalles abrumadores.',    '2023-09-28'),
(20, 5, 4,  9, 'Ritmo pausado pero brillante.',        '2023-09-29'),
(21, 5, 2, 10, 'Muy inmersivo.',                       '2023-09-30'),
(22, 5, 10, 9, 'Paisajes espectaculares.',             '2023-10-01'),

-- Death Stranding
(23, 6, 4,  7, 'Experiencia rara pero interesante.',   '2023-10-02'),
(24, 6, 6,  8, 'Audiovisual potente.',                 '2023-10-03'),
(25, 6, 8,  7, 'No es para todos.',                    '2023-10-04'),

-- Cyberpunk 2077
(26, 7, 5,  8, 'Mejoró con parches.',                  '2023-10-05'),
(27, 7, 6,  7, 'Buenísimo tras actualizaciones.',      '2023-10-06'),
(28, 7, 9,  8, 'Night City es brutal.',                '2023-10-07'),
(29, 7, 1,  7, 'Al principio tuvo bugs.',              '2023-10-08'),
(30, 7, 10, 8, 'Historia notable.',                    '2023-10-09'),

-- Super Mario Odyssey
(31, 8, 2,  9, 'Creativo y redondo.',                  '2023-10-10'),
(32, 8, 7,  9, 'Plataformas con ritmo.',               '2023-10-11'),
(33, 8, 3,  8, 'Coleccionables a montones.',           '2023-10-12'),

-- Sekiro
(34, 9, 3,  9, 'Combate exquisito.',                   '2023-10-13'),
(35, 9, 4,  8, 'Duro pero justo.',                     '2023-10-14'),
(36, 9, 6,  9, 'Parry satisfactorio.',                 '2023-10-15'),
(37, 9, 7,  8, 'Algo corto, pero intenso.',            '2023-10-16'),

-- Reseñas extra cruzadas (mismos usuarios reseñando varios juegos)
(38, 1, 3,  9, 'Zelda engancha mucho.',                '2023-10-17'),
(39, 5, 1, 10, 'Mi favorito de Rockstar.',             '2023-10-18'),
(40, 2, 2, 10, 'Obra maestra moderna.',                '2023-10-19'),
(41, 3, 7,  9, 'Mundo vivo y decisiones.',             '2023-10-20'),
(42, 8, 1,  8, 'Muy buen Mario.',                      '2023-10-21');

-- Observaciones para tus prácticas:
-- - Usuarios 1..10 han dejado múltiples reseñas. 11 y 12 no han reseñado (para ejercicios de LEFT JOIN/IS NULL).
-- - Hay juegos con 5+ reseñas (Elden Ring, Witcher 3, GTA V, RDR2, Sekiro) y otros con 3–4.
-- - Fechas repartidas para trabajar BETWEEN, ORDER BY y filtros temporales.
-- - Puntuaciones variadas para GROUP BY/HAVING (promedios, máximos, recuentos).
