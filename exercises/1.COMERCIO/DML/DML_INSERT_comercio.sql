-- ==============================
-- INSERT Comercio: Modelo en PostgreSQL
-- ==============================

/*
1. Se crean 2 proveedores, 2 clientes, 2 tiendas.
2. Se cargan 2 tipos de empleado, y 2 empleados.
3. Se registran 3 productos con precios y stocks iniciales.
4. Se hacen movimientos de inventario, una compra y una venta con detalle.
*/

-- ==============================
-- Proveedores
-- ==============================
INSERT INTO comercio.proveedor (nombre, codigo, direccion, telefono, email, fecha_registro)
VALUES 
('Proveedor A', 'PROV-A', 'Calle Mayor 123', '600111222', 'contacto@prova.com', NOW()),
('Proveedor B', 'PROV-B', 'Avenida Sur 456', '600333444', 'ventas@provb.com', NOW());

-- ==============================
-- Clientes
-- ==============================
INSERT INTO comercio.cliente (dni, nombre, email, telefono, fecha_registro)
VALUES
('12345678A', 'Juan Pérez', 'juanperez@email.com', '611223344', NOW()),
('87654321B', 'María López', 'marialopez@email.com', '622334455', NOW());

-- ==============================
-- Tiendas
-- ==============================
INSERT INTO comercio.tienda (nombre, direccion, telefono, fecha_registro)
VALUES
('Tienda Centro', 'Plaza España 1', '633445566', NOW()),
('Tienda Norte', 'Calle Norte 99', '644556677', NOW());

-- ==============================
-- Tipos de empleados
-- ==============================
INSERT INTO comercio.tipo_empleado (nombre, sueldo, fecha_registro)
VALUES
('Cajero', 1200.00, NOW()),
('Gerente', 2500.00, NOW());

-- ==============================
-- Empleados
-- ==============================
INSERT INTO comercio.empleado (tipo_empleado_id, dni, nombre, email, telefono, fecha_registro)
VALUES
(1, '11111111C', 'Carlos Sánchez', 'csanchez@tienda.com', '655667788', NOW()),
(2, '22222222D', 'Ana Torres', 'atorres@tienda.com', '666778899', NOW());

-- ==============================
-- Productos
-- ==============================
INSERT INTO comercio.producto (proveedor_id, codigo_interno, nombre, precio, fecha_registro)
VALUES
(1, 'P001', 'Camiseta Deportiva', 25.50, NOW()),
(1, 'P002', 'Zapatillas Running', 59.90, NOW()),
(2, 'P003', 'Pantalón Jeans', 39.95, NOW());

-- ==============================
-- Histórico de precios
-- ==============================
INSERT INTO comercio.producto_precio (producto_id, precio, fecha_inicio, fecha_fin)
VALUES
(1, 24.99, NOW() - INTERVAL '30 days', NOW()),
(2, 55.00, NOW() - INTERVAL '60 days', NOW() - INTERVAL '10 days'),
(3, 42.00, NOW() - INTERVAL '90 days', NULL);

-- ==============================
-- Inventario
-- ==============================
INSERT INTO comercio.inventario (producto_id, tienda_id, stock_actual, stock_minimo, stock_maximo, fecha_actualizacion)
VALUES
(1, 1, 50, 5, 100, NOW()),
(2, 1, 20, 2, 50, NOW()),
(3, 2, 30, 3, 60, NOW());

-- ==============================
-- Movimientos de inventario
-- ==============================
INSERT INTO comercio.movimiento_inventario (producto_id, tienda_id, tipo_movimiento, cantidad, referencia, fecha_movimiento)
VALUES
(1, 1, 'ENTRADA', 100, 'Compra inicial', NOW()),
(2, 1, 'SALIDA', 5, 'Venta V001', NOW());

-- ==============================
-- Compras
-- ==============================
INSERT INTO comercio.compra (proveedor_id, empleado_id, tienda_id, monto_total, fecha_registro)
VALUES
(1, 2, 1, 500.00, NOW());

INSERT INTO comercio.compra_producto (compra_id, producto_id, cantidad, precio_unitario, subtotal, fecha_registro)
VALUES
(1, 1, 100, 5.00, 500.00, NOW());

-- ==============================
-- Ventas
-- ==============================
INSERT INTO comercio.venta (cliente_id, empleado_id, tienda_id, monto_total, fecha_registro)
VALUES
(1, 1, 1, 51.00, NOW());

INSERT INTO comercio.venta_producto (venta_id, producto_id, cantidad, subtotal, fecha_registro)
VALUES
(1, 1, 2, 51.00, NOW());
