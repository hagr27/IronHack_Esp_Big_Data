-- Esquema: gym

CREATE SCHEMA IF NOT EXISTS gym;

-- Tabla membresia
CREATE TABLE gym.membresia (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(15),
    precio DECIMAL(4,2),
    fecha_registro TIMESTAMP
);

-- Tabla cliente
CREATE TABLE gym.cliente (
    id SERIAL PRIMARY KEY,
    membresia_id INTEGER,
    nombre VARCHAR(30),
    apellido VARCHAR(50),
    email VARCHAR(50),
    telefono VARCHAR(10),
    fecha_registro TIMESTAMP,
    CONSTRAINT fk_membresia FOREIGN KEY (membresia_id) REFERENCES gym.membresia(id)
);

-- Tabla entrenador
CREATE TABLE gym.entrenador (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30),
    apellido VARCHAR(50),
    email VARCHAR(50),
    telefono VARCHAR(10),
    fecha_registro TIMESTAMP
);

-- Tabla sala
CREATE TABLE gym.sala (
    id SERIAL PRIMARY KEY,
    sala_nombre VARCHAR(20),
    capacidad_pax INTEGER,
    fecha_registro TIMESTAMP
);

-- Tabla clase
CREATE TABLE gym.clase (
    id SERIAL PRIMARY KEY,
    clase_nombre VARCHAR(20),
    duracion_min INTEGER,
    categoria VARCHAR(30),
    fecha_registro TIMESTAMP
);

-- Tabla sesion
CREATE TABLE gym.sesion (
    id SERIAL PRIMARY KEY,
    sala_id INTEGER,
    entrenador_id INTEGER,
    clase_id INTEGER,
    fecha DATE,
    hora TIME,
    fecha_registro TIMESTAMP,
    CONSTRAINT fk_sala FOREIGN KEY (sala_id) REFERENCES gym.sala(id),
    CONSTRAINT fk_entrenador FOREIGN KEY (entrenador_id) REFERENCES gym.entrenador(id),
    CONSTRAINT fk_clase FOREIGN KEY (clase_id) REFERENCES gym.clase(id)
);

-- Tabla cliente_sesion (relación muchos a muchos entre cliente y sesion)
CREATE TABLE gym.cliente_sesion (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER,
    sesion_id INTEGER,
    fecha_registro TIMESTAMP,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES gym.cliente(id),
    CONSTRAINT fk_sesion FOREIGN KEY (sesion_id) REFERENCES gym.sesion(id)
);
