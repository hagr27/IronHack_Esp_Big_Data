/*
 -- Lista todas las FK del esquema 'comercio'
SELECT
    con.conname AS fk_name
    ,sch.nspname AS schema_name
    ,rel_t.relname AS table_name
    ,att_t.attname AS column_name
    ,rel_f.relname AS referenced_table
    ,att_f.attname AS referenced_column
FROM pg_constraint con
JOIN pg_class rel_t     ON rel_t.oid = con.conrelid
JOIN pg_namespace sch   ON sch.oid = rel_t.relnamespace
JOIN pg_attribute att_t ON att_t.attrelid = rel_t.oid AND att_t.attnum = ANY(con.conkey)
JOIN pg_class rel_f     ON rel_f.oid = con.confrelid
JOIN pg_attribute att_f ON att_f.attrelid = rel_f.oid AND att_f.attnum = ANY(con.confkey)
WHERE con.contype = 'f'
  AND sch.nspname = 'comercio'
ORDER BY table_name, fk_name;
*/


-- 1. Consultar todos los clientes
select cliente_id
      ,dni
      ,nombre
      ,email
      ,telefono
      ,fecha_registro
FROM comercio.cliente
where cliente_id  != 1;

-- 2. Listar productos con su proveedor
SELECT p.producto_id
      ,p.nombre AS producto
      ,pr.nombre AS proveedor
      ,p.precio
FROM comercio.producto p
JOIN comercio.proveedor pr 
  ON p.proveedor_id = pr.proveedor_id;

-- 3. Ver inventario de una tienda
SELECT i.producto_id
      ,p.nombre AS producto
      ,i.stock_actual
      ,i.stock_minimo
      ,i.stock_maximo
FROM comercio.inventario i
JOIN comercio.producto p 
  ON i.producto_id = p.producto_id
WHERE i.tienda_id = 1;

-- 4. Ventas con detalle de productos
SELECT v.venta_id
      ,c.nombre AS cliente
      ,e.nombre AS empleado
      ,t.nombre AS tienda
      ,vp.producto_id
      ,p.nombre AS producto
      ,vp.cantidad
      ,vp.subtotal
      ,v.monto_total
      ,v.fecha_registro
FROM comercio.venta v
JOIN comercio.cliente c  ON v.cliente_id = c.cliente_id
JOIN comercio.empleado e ON v.empleado_id = e.empleado_id
JOIN comercio.tienda t   ON v.tienda_id = t.tienda_id
JOIN comercio.venta_producto vp ON v.venta_id = vp.venta_id
JOIN comercio.producto p ON vp.producto_id = p.producto_id;

-- Ventas Total cliente
SELECT c.nombre AS cliente
      ,SUM(v.monto_total) AS total_gastado
FROM comercio.venta v
JOIN comercio.cliente c
  ON v.cliente_id = c.cliente_id
WHERE v.cliente_id = 1
GROUP BY c.nombre;

-- Ventas ultima clienet
SELECT v.venta_id
      ,v.monto_total
      ,v.fecha_registro
FROM comercio.venta v
WHERE v.cliente_id = 1
ORDER BY v.fecha_registro DESC
LIMIT 1;


-- 5. Compras realizadas a un proveedor con detalle
SELECT co.compra_id
      ,pr.nombre AS proveedor
      ,e.nombre AS empleado
      ,t.nombre AS tienda
      ,cp.producto_id
      ,p.nombre AS producto
      ,cp.cantidad
      ,cp.precio_unitario
      ,cp.subtotal, co.monto_total
FROM comercio.compra co
JOIN comercio.proveedor pr ON co.proveedor_id = pr.proveedor_id
JOIN comercio.empleado e   ON co.empleado_id = e.empleado_id
JOIN comercio.tienda t     ON co.tienda_id = t.tienda_id
JOIN comercio.compra_producto cp ON co.compra_id = cp.compra_id
JOIN comercio.producto p ON cp.producto_id = p.producto_id;
