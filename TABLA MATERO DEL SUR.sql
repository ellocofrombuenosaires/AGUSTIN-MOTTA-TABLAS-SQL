DROP SCHEMA IF EXISTS entregas;
CREATE SCHEMA entregas;
USE entregas;

CREATE TABLE cliente (
id_cliente INT PRIMARY KEY ,
nombre VARCHAR (50),
email VARCHAR(50) UNIQUE,
telefono VARCHAR(50) UNIQUE,
domicilio VARCHAR (50) ,
cumple date 
);

CREATE TABLE proveedor (
id_proveedor INT PRIMARY KEY ,
nombre VARCHAR (50) NOT NULL ,
contacto VARCHAR (50) NOT NULL ,
rubro TEXT
) ;

CREATE TABLE producto (
id_producto INT PRIMARY KEY ,
id_proveedor INT,
nombre VARCHAR (50) NOT NULL ,
descripcion TEXT ,
precio DECIMAL (10, 2) ,
categoria VARCHAR (50) ,
FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor)
) ;

CREATE TABLE compra (
id_compra INT PRIMARY KEY AUTO_INCREMENT ,
id_proveedor INT ,
id_producto INT ,
cantidad INT ,
fecha_compra DATE ,
FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor) ,
FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
) ;

CREATE TABLE venta (
id_venta INT PRIMARY KEY AUTO_INCREMENT ,
id_cliente INT ,
id_producto INT ,
cantidad INT ,
fecha_venta DATE ,
FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) ,
FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
) ;

INSERT INTO cliente (id_cliente, nombre, email, telefono, domicilio, cumple) VALUES (1, "GUSTAVO LOPEZ", "chupalopez@gmail.com", 1123242567, "Cabrero 2012", "1990-07-04");
INSERT INTO cliente (id_cliente, nombre, email, telefono, domicilio, cumple) VALUES (2, "XAVI HERNANDEZ", "tikitiki@gmail.com", 1123345621, "Miller 2345", "1986-07-04");
INSERT INTO cliente (id_cliente, nombre, email, telefono, domicilio, cumple) VALUES (3, "XABI ALONSO", "casablanca@gmail.com", 1123345645, "Julian Lagos 1023", "1982-06-07");
INSERT INTO cliente (id_cliente, nombre, email, telefono, domicilio, cumple) VALUES (4, "JORGE BURRUCHAGA", "burrugol@gmail.com", 1145678900, "Lascano 265", "1970-05-08");
INSERT INTO cliente (id_cliente, nombre, email, telefono, domicilio, cumple) VALUES (5, "JORGE VALDANO", "valdanito@gmail.com", 1146578866, "Mexico 1986", "1966-04-07");

INSERT INTO proveedor (id_proveedor, nombre, contacto, rubro) VALUES (1, "LASKA", 1123478932, "Mates");
INSERT INTO proveedor (id_proveedor, nombre, contacto, rubro) VALUES (2, "REI VERDE", 1123480421, "Yerba Mate");
INSERT INTO proveedor (id_proveedor, nombre, contacto, rubro) VALUES (3, "CANARIAS", 11445480421, "Yerba Mate");
INSERT INTO proveedor (id_proveedor, nombre, contacto, rubro) VALUES (4, "HOT CARAMEL", 1190908686, "Accesorios materos");

INSERT INTO producto (id_producto, id_proveedor, nombre, descripcion, precio, categoria)
VALUES 
(1, 1, "MATE TORPEDO", "Mate torpedo de calabaza", 15.50, "Mates"),
(2, 1, "MATE DE ALGARROBO", "Mate camionero de calabaza", 12.50, "Mates"), 
(3, 2, " YERBA REI VERDE CLASICA", "Yerba despalada de sabor intenso y exotico", 6.50, "Yerba Mate"),
(4, 2, "YERBA REI VERDE PADRON ARGENTINO", "Yerba con palo de sabor suave y duradero", 5.00, "Yerba Mate"),
(5, 2, "YERBA REI VERDE PREMIUM", "Yerba despalada de sabor intenos", 7.50, "Yerba Mate"),
(6, 2, "YERBA REI VERDE COMPUESTA", "Yerba despalada con hierbas del sur de brasil", 6.00, "Yerba Mate");

INSERT INTO compra (id_proveedor, id_producto, cantidad, fecha_compra)
VALUES
(1, 1, 5, '2025-02-01'),
(2, 4, 50, '2025-02-02'),
(2, 5, 200, '2025-02-03');

INSERT INTO venta (id_cliente, id_producto, cantidad, fecha_venta)
VALUES
(1, 1, 2, '2025-02-01'),   
(2, 3, 5, '2025-02-02'),   
(3, 2, 3, '2025-02-03');  


