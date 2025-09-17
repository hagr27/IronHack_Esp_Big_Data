-- ==============================
-- DELETE de todas las tablas
-- ==============================

TRUNCATE TABLE
    comercio.compra_producto,
    comercio.compra,
    comercio.venta_producto,
    comercio.venta,
    comercio.movimiento_inventario,
    comercio.inventario,
    comercio.producto_precio,
    comercio.producto,
    comercio.empleado,
    comercio.tipo_empleado,
    comercio.cliente,
    comercio.tienda,
    comercio.proveedor
RESTART IDENTITY CASCADE;