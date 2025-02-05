USE entregas;

DELIMITER $$

CREATE FUNCTION precio_promedio_categoria (p_categoria VARCHAR(50))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10, 2);
    
    SELECT AVG(p.precio)
    INTO promedio
    FROM producto p
    WHERE p.categoria = p_categoria;
    
    RETURN promedio;
END$$
DELIMITER ;

DELIMITER $$

CREATE FUNCTION total_compras_proveedor (p_id_proveedor INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    
    SELECT SUM(c.cantidad * p.precio)
    INTO total
    FROM compra c
    JOIN producto p ON c.id_producto = p.id_producto
    WHERE c.id_proveedor = p_id_proveedor;
    
    RETURN total;
END$$

DELIMITER ;

