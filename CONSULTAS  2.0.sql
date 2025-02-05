USE entregas;
SELECT * FROM cliente;

SELECT c.nombre AS cliente, p.nombre AS producto, v.cantidad, v.fecha_venta
FROM venta v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN producto p ON v.id_producto = p.id_producto
WHERE c.id_cliente = 1;

SELECT pr.nombre AS proveedor, p.nombre AS producto, c.cantidad, c.fecha_compra
FROM compra c
JOIN proveedor pr ON c.id_proveedor = pr.id_proveedor
JOIN producto p ON c.id_producto = p.id_producto
WHERE pr.id_proveedor = 2;  
 