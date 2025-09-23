-- Insertar géneros de ejemplo
INSERT INTO genero (genero) VALUES ('Novela'), ('Infantil'), ('Ciencia Ficcion');

-- Insertar libros de ejemplo
INSERT INTO libro (titulo, fecha_publicacion, paginas, genero_id_genero) VALUES
('Cien Años de Soledad', '1967-05-30', 417, 1),
('El Principito', '1943-04-06', 96, 2),
('1984', '1949-06-08', 328, 3);

-- Insertar préstamos de ejemplo
INSERT INTO prestamo (usuario_alias, id_libro, fecha_solicitud, fecha_prestamo, fecha_devolucion) VALUES
('jdoe', 1, NOW(), NOW(), NULL),
('jdoe', 3, NOW(), NOW(), NULL),
('asmith', 2, NOW(), NOW(), NULL);