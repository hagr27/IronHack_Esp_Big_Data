-- ==============================
-- INSERT VideoGame: Modelo en PostgreSQL
-- ==============================

-- ==============================
-- videogame.creador
-- ==============================
INSERT INTO videogame.creador VALUES
(1, 'Nintendo', 'estudio'),
(2, 'FromSoftware', 'estudio'),
(3, 'CD Projekt Red', 'estudio'),
(4, 'Rockstar Games', 'estudio'),
(5, 'Hideo Kojima', 'persona');

INSERT INTO videogame.creador (nombre, tipo ) VALUES
( 'Sergio Lopez', 'persona');

-- ==============================
-- videogame.juego
-- ==============================
INSERT INTO videogame.juego VALUES
(1, 'The Legend of Zelda: Breath of the Wild', '2017-03-03', 'Aventura', 1),
(2, 'Elden Ring', '2022-02-25', 'RPG', 2),
(3, 'The Witcher 3: Wild Hunt', '2015-05-19', 'RPG', 3),
(4, 'Grand Theft Auto V', '2013-09-17', 'Accion', 4),
(5, 'Death Stranding', '2019-11-08', 'Aventura', 5),
(6, 'Red Dead Redemption 2', '2018-10-26', 'Accion', 4),
(7, 'Cyberpunk 2077', '2020-12-10', 'RPG', 3);

-- ==============================
-- videogame.resenia
-- ==============================
INSERT INTO videogame.resenia VALUES
(1, 1, 'Carlos', 10, 'Una obra maestra de aventura', '2023-09-10'),
(2, 1, 'Ana', 9, 'Muy bonito y con libertad', '2023-09-11'),
(3, 2, 'Pedro', 10, 'Increible mundo abierto', '2023-09-12'),
(4, 2, 'Laura', 8, 'Difícil pero adictivo', '2023-09-13'),
(5, 3, 'Marta', 9, 'Historia impresionante', '2023-09-14'),
(6, 3, 'David', 8, 'Buen RPG aunque largo', '2023-09-15'),
(7, 4, 'Lucía', 10, 'Muy divertido con amigos', '2023-09-16'),
(8, 4, 'Carlos', 9, 'Gran ciudad y libertad', '2023-09-17'),
(9, 5, 'Ana', 7, 'Interesante pero raro', '2023-09-18'),
(10, 6, 'Pedro', 10, 'Cinemático y profundo', '2023-09-19'),
(11, 6, 'Laura', 9, 'Detalles increibles', '2023-09-20'),
(12, 7, 'Marta', 8, 'Gráficos buenos, bugs al inicio', '2023-09-21'),
(13, 7, 'David', 7, 'Ha mejorado con los parches', '2023-09-22');

