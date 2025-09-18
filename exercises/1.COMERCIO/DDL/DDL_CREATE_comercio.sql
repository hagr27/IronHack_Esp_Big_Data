-- ==============================
-- CREATE Comercio: Modelo en PostgreSQL
-- ==============================

-- ==============================
-- Tablas
-- ==============================
CREATE SCHEMA IF NOT EXISTS comercio;

CREATE TABLE comercio.proveedor (
    proveedor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    codigo VARCHAR(50),
    direccion VARCHAR(200),
    telefono VARCHAR(50),
    email VARCHAR(50),
    fecha_registro TIMESTAMP
);

CREATE TABLE comercio.cliente (
    cliente_id SERIAL PRIMARY KEY,
    dni CHAR(9),
    nombre VARCHAR(100),
    email VARCHAR(50),
    telefono VARCHAR(50),
    fecha_registro TIMESTAMP
);

CREATE TABLE comercio.tienda (
    tienda_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(50),
    fecha_registro TIMESTAMP
);

CREATE TABLE comercio.tipo_empleado (
    tipo_empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    sueldo DECIMAL(10,2),
    fecha_registro TIMESTAMP
);

CREATE TABLE comercio.empleado (
    empleado_id SERIAL PRIMARY KEY,
    tipo_empleado_id INTEGER REFERENCES comercio.tipo_empleado(tipo_empleado_id),
    dni CHAR(9),
    nombre VARCHAR(100),
    email VARCHAR(50),
    telefono VARCHAR(50),
    fecha_registro TIMESTAMP
);

CREATE TABLE comercio.producto (
    producto_id SERIAL PRIMARY KEY,
    proveedor_id INTEGER REFERENCES comercio.proveedor(proveedor_id),
    codigo_interno VARCHAR(100),
    nombre VARCHAR(50),
    precio DECIMAL(10,2),
    fecha_registro TIMESTAMP
);

CREATE TABLE comercio.producto_precio (
    producto_precio_id SERIAL PRIMARY KEY,
    producto_id INTEGER REFERENCES comercio.producto(producto_id),
    precio DECIMAL(10,2),
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP
);

CREATE TABLE comercio.inventario (
    inventario_id SERIAL PRIMARY KEY,
    producto_id INTEGER REFERENCES comercio.producto(producto_id),
    tienda_id INTEGER REFERENCES comercio.tienda(tienda_id),
    stock_actual INTEGER,
    stock_minimo INTEGER,
    stock_maximo INTEGER,
    fecha_actualizacion TIMESTAMP,
    UNIQUE(producto_id, tienda_id)
);

CREATE TABLE comercio.movimiento_inventario (
    movimiento_id SERIAL PRIMARY KEY,
    producto_id INTEGER REFERENCES comercio.producto(producto_id),
    tienda_id INTEGER REFERENCES comercio.tienda(tienda_id),
    tipo_movimiento VARCHAR(20),
    cantidad INTEGER,
    referencia VARCHAR(100),
    fecha_movimiento TIMESTAMP
);

CREATE TABLE comercio.venta (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES comercio.cliente(cliente_id),
    empleado_id INTEGER REFERENCES comercio.empleado(empleado_id),
    tienda_id INTEGER REFERENCES comercio.tienda(tienda_id),
    monto_total DECIMAL(10,2),
    fecha_registro TIMESTAMP
);

CREATE TABLE comercio.venta_producto (
    venta_producto_id SERIAL PRIMARY KEY,
    venta_id INTEGER REFERENCES comercio.venta(venta_id),
    producto_id INTEGER REFERENCES comercio.producto(producto_id),
    cantidad INTEGER,
    subtotal DECIMAL(10,2),
    fecha_registro TIMESTAMP
);

CREATE TABLE comercio.compra (
    compra_id SERIAL PRIMARY KEY,
    proveedor_id INTEGER REFERENCES comercio.proveedor(proveedor_id),
    empleado_id INTEGER REFERENCES comercio.empleado(empleado_id),
    tienda_id INTEGER REFERENCES comercio.tienda(tienda_id),
    monto_total DECIMAL(10,2),
    fecha_registro TIMESTAMP
);

CREATE TABLE comercio.compra_producto (
    compra_producto_id SERIAL PRIMARY KEY,
    compra_id INTEGER REFERENCES comercio.compra(compra_id),
    producto_id INTEGER REFERENCES comercio.producto(producto_id),
    cantidad INTEGER,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    fecha_registro TIMESTAMP
);

