USE entregas;

DELIMITER $$

CREATE TRIGGER actualizar_stock_venta
AFTER INSERT ON venta
FOR EACH ROW
BEGIN
    UPDATE producto
    SET cantidad = cantidad - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER evitar_cliente_email_duplicado
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
    DECLARE email_count INT;
    

    SELECT COUNT(*) INTO email_count
    FROM cliente
    WHERE email = NEW.email;
    
    -- Si el email ya existe, lanzamos un error
    IF email_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El correo electrónico ya está registrado para otro cliente.';
    END IF;
END $$

DELIMITER ;



