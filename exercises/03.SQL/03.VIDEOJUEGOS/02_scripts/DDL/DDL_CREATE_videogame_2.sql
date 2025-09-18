-- ==============================
-- CREATE del esquema - videogame_2
-- ==============================

CREATE SCHEMA IF NOT EXISTS videogame_2;

-- Tabla: Creadores
CREATE TABLE videogame_2.creadores (
  id_creador INT NOT NULL PRIMARY KEY,
  nombre VARCHAR(120),
  tipo VARCHAR(30),
  pais VARCHAR(60),
  anio_fundacion INT
);

-- Tabla: Usuarios
CREATE TABLE videogame_2.usuarios (
  id_usuario INT NOT NULL PRIMARY KEY,
  nick VARCHAR(60),
  email VARCHAR(120),
  fecha_registro DATE,
  pais VARCHAR(60)
);

-- Tabla: Juegos (FK -> Creadores)
CREATE TABLE videogame_2.juegos (
  id_juego INT NOT NULL PRIMARY KEY,
  titulo VARCHAR(150),
  fecha_lanzamiento DATE,
  genero VARCHAR(60),
  id_creador INT,
  FOREIGN KEY (id_creador) REFERENCES videogame_2.creadores(id_creador)
);


-- Tabla: Reseñas (FK -> Juegos, Usuarios)
CREATE TABLE videogame_2.resenias (
  id_resena INT NOT NULL PRIMARY KEY,
  id_juego INT,
  id_usuario INT,
  puntuacion INT,
  comentario TEXT,
  fecha DATE,
  FOREIGN KEY (id_juego) REFERENCES videogame_2.juegos(id_juego),
  FOREIGN KEY (id_usuario) REFERENCES videogame_2.usuarios(id_usuario)
);

-- Tabla: PremiosCreador (FK -> Creadores)
CREATE TABLE videogame_2.premios_creador (
  id_premio INT NOT NULL PRIMARY KEY,
  id_creador INT,
  nombre_premio VARCHAR(120),
  categoria VARCHAR(120),
  anio INT,
  resultado VARCHAR(20),
  FOREIGN KEY (id_creador) REFERENCES videogame_2.creadores(id_creador)
);
