-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- Creamos el esquema 'mydb' si no existe y lo seleccionamos como esquema por defecto
CREATE SCHEMA IF NOT EXISTS mydb;
SET search_path TO mydb;


-- -----------------------------------------------------
-- Table mydb.genero
-- -----------------------------------------------------
-- Tabla que almacena los géneros de los libros
CREATE TABLE IF NOT EXISTS mydb.genero (
    id_genero SERIAL PRIMARY KEY,           -- Identificador único del género
    genero VARCHAR(50)                      -- Nombre del género
);

-- -----------------------------------------------------
-- Table mydb.libro
-- -----------------------------------------------------
-- Tabla que almacena información básica de los libros
CREATE TABLE IF NOT EXISTS mydb.libro (
    id_libro SERIAL PRIMARY KEY,            -- Identificador único del libro
    titulo VARCHAR(100),                     -- Título del libro
    fecha_publicacion DATE,                  -- Fecha de publicación
    paginas INT,                             -- Número de páginas
    genero_id_genero INT NOT NULL REFERENCES mydb.genero(id_genero) ON DELETE NO ACTION ON UPDATE NO ACTION
                                            -- Referencia al género del libro
);

-- -----------------------------------------------------
-- Table mydb.autor
-- -----------------------------------------------------
-- Tabla que almacena información de los autores
CREATE TABLE IF NOT EXISTS mydb.autor (
    id_autor SERIAL PRIMARY KEY,            -- Identificador único del autor
    nombre VARCHAR(50),                     -- Nombre del autor
    apellido_1 VARCHAR(50),                 -- Primer apellido
    apellido_2 VARCHAR(50)                  -- Segundo apellido
);

-- -----------------------------------------------------
-- Table mydb.prestamo
-- -----------------------------------------------------
-- Tabla que registra los préstamos de libros a usuarios
CREATE TABLE IF NOT EXISTS mydb.prestamo (
    id_prestamo SERIAL PRIMARY KEY,         -- Identificador único del préstamo
    usuario_id_usuario INT NOT NULL 
      REFERENCES usuario(id_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION, -- Referencia al usuario que solicita el préstamo
    fecha_solicitud TIMESTAMP,              -- Fecha en la que se solicita el préstamo
    fecha_prestamo TIMESTAMP,               -- Fecha de inicio del préstamo
    fecha_devolucion TIMESTAMP              -- Fecha de devolución
);

-- -----------------------------------------------------
-- Table mydb.libro_detalle
-- -----------------------------------------------------
-- Tabla que almacena información detallada de cada ejemplar del libro
CREATE TABLE IF NOT EXISTS mydb.libro_detalle (
    id_detalle SERIAL PRIMARY KEY,          -- Identificador único del detalle
    fecha_registro TIMESTAMP,               -- Fecha en la que se registra el ejemplar
    edicion_edicion DATE,                    -- Fecha de edición del ejemplar
    libro_id_libro INT NOT NULL REFERENCES mydb.libro(id_libro) ON DELETE NO ACTION ON UPDATE NO ACTION
                                            -- Referencia al libro correspondiente
);

-- -----------------------------------------------------
-- Table mydb.autor_has_libro
-- -----------------------------------------------------
-- Tabla que relaciona autores con libros (muchos a muchos)
CREATE TABLE IF NOT EXISTS mydb.autor_has_libro (
    id SERIAL PRIMARY KEY,                  -- Identificador único de la relación
    autor_id_autor INT NOT NULL REFERENCES autor(id_autor) ON DELETE NO ACTION ON UPDATE NO ACTION,
                                            -- Referencia al autor
    libro_id_libro INT NOT NULL REFERENCES libro(id_libro) ON DELETE NO ACTION ON UPDATE NO ACTION
                                            -- Referencia al libro
);

-- -----------------------------------------------------
-- Table mydb.libro_movimiento
-- -----------------------------------------------------
-- Tabla que registra movimientos de ejemplares de libros (préstamos, devoluciones)
CREATE TABLE IF NOT EXISTS mydb.libro_movimiento (
    id_libro_mov SERIAL PRIMARY KEY,        -- Identificador único del movimiento
    fecha TIMESTAMP,                        -- Fecha del movimiento
    libro_detalle_id_detalle INT NOT NULL REFERENCES libro_detalle(id_detalle) ON DELETE NO ACTION ON UPDATE NO ACTION,
                                            -- Referencia al ejemplar del libro
    prestamo_id_prestamo INT NOT NULL REFERENCES prestamo(id_prestamo) ON DELETE NO ACTION ON UPDATE NO ACTION,
                                            -- Referencia al préstamo asociado
    estado CHAR(1),                         -- Estado del movimiento (ej. 'P' prestado, 'D' devuelto)
    cantidad INT                             -- Cantidad de ejemplares movidos
);

-- -----------------------------------------------------
-- Table mydb.libro_total
-- -----------------------------------------------------
-- Tabla que mantiene el total de ejemplares disponibles por libro
CREATE TABLE IF NOT EXISTS mydb.libro_total (
    id_libro_total SERIAL PRIMARY KEY,      -- Identificador único del registro
    libro_id_libro INT NOT NULL REFERENCES libro(id_libro) ON DELETE NO ACTION ON UPDATE NO ACTION,
                                            -- Referencia al libro
    cantidad_total INT,                      -- Cantidad total de ejemplares
    ultima_actualizacion TIMESTAMP           -- Fecha de última actualización del total
);
