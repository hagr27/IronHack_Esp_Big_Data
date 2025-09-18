-- 1. Actualizar el email de un cliente
UPDATE comercio.cliente
SET email = 'nuevo_correo@cliente.com'
WHERE cliente_id = 1;

-- 2. Cambiar el sueldo de un tipo de empleado
UPDATE comercio.tipo_empleado
SET sueldo = sueldo + 200
WHERE nombre = 'Cajero';

-- 3. Modificar el precio de un producto
UPDATE comercio.producto
SET precio = 27.50
WHERE producto_id = 1;

-- 4. Ajustar el stock de un producto en una tienda
UPDATE comercio.inventario
SET stock_actual = stock_actual - 2, fecha_actualizacion = NOW()
WHERE producto_id = 1 AND tienda_id = 1;

-- 5. Actualizar el estado de un movimiento de inventario (ejemplo: corregir referencia)
UPDATE comercio.movimiento_inventario
SET referencia = 'Venta corregida V001'
WHERE movimiento_id = 2;
