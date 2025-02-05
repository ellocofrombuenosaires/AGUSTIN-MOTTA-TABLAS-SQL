USE entregas;

DELIMITER $$
CREATE PROCEDURE producto_mas_vendido ()
BEGIN
    SELECT p.nombre AS producto, SUM(v.cantidad) AS total_vendido
    FROM venta v
    JOIN producto p ON v.id_producto = p.id_producto
    GROUP BY p.id_producto
    ORDER BY total_vendido DESC
    LIMIT 1;
END$$
DELIMITER ;

CALL producto_mas_vendido();

DELIMITER $$
CREATE PROCEDURE total_ventas_cliente (
    IN p_id_cliente INT
)
BEGIN
    SELECT cl.nombre AS cliente, SUM(v.cantidad * p.precio) AS total_vendido
    FROM venta v
    JOIN producto p ON v.id_producto = p.id_producto
    JOIN cliente cl ON v.id_cliente = cl.id_cliente
    WHERE cl.id_cliente = p_id_cliente
    GROUP BY cl.id_cliente;
END$$
DELIMITER ;

CALL total_ventas_cliente(1); 
