-- Esquema: gym

CREATE SCHEMA IF NOT EXISTS videogame;


CREATE TABLE videogame.creador (
	id_creador SERIAL PRIMARY KEY,
	nombre VARCHAR(120) NOT NULL,
	tipo VARCHAR(30) CHECK (tipo IN ('estudio','persona','editor','otro')) DEFAULT 'estudio'
);

CREATE TABLE videogame.juego (
	id_juego SERIAL PRIMARY KEY,
	titulo VARCHAR(150) NOT NULL,
	fecha_lanzamiento DATE,
	genero VARCHAR(60),
	id_creador INT NOT NULL,
	FOREIGN KEY (id_creador) REFERENCES videogame.creador(id_creador) ON DELETE RESTRICT
);

CREATE TABLE videogame.resenia (
	id_resenia SERIAL PRIMARY KEY,
	id_juego INT NOT NULL,
	autor VARCHAR(60) NOT NULL,
	puntuacion INT NOT NULL CHECK (puntuacion BETWEEN 1 AND 10),
	comentario TEXT,
	fecha DATE,
	FOREIGN KEY (id_juego) REFERENCES videogame.juego(id_juego) ON DELETE CASCADE
);
