create database crud
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish_ci;
use crud;

CREATE TABLE proveedores (
  proveedor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  telefono VARCHAR(20),
  email VARCHAR(100),
  direccion VARCHAR(255),
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB

create table productos(
id_producto int auto_increment primary key, 
nombre_producto varchar(150),
precio_producto decimal(8,2),
cantidad_producto smallint,
fecha_producto datetime,
fecha_actualizacion_producto datetime,
fecha_eliminacion_producto datetime,
estado char(1) NOT NULL DEFAULT 'A',
id_proveedor INT UNSIGNED,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(proveedor_id)
ON UPDATE CASCADE
ON DELETE RESTRICT
);

INSERT INTO proveedores (nombre, telefono, email, direccion) VALUES
('Tech Dominicana SRL', '809-555-2001', 'info@techdominicana.com.do', 'Av. Abraham Lincoln #125, Santo Domingo'),
('Soluciones Digitales RD', '809-555-2002', 'contacto@solucionesrd.com', 'Av. Bolívar #203, Santo Domingo'),
('Dominitech Group', '809-555-2003', 'ventas@dominitech.com', 'Calle Mella #45, Santiago'),
('InnovaTech Caribe', '809-555-2004', 'soporte@innovatech.com.do', 'Av. Duarte, San Cristóbal'),
('Sistemas Quisqueya', '809-555-2005', 'contacto@sistemasquisqueya.do', 'Calle Restauración #21, La Vega'),
('Bytes del Cibao', '809-555-2006', 'ventas@bytescibao.com', 'Av. Estrella Sadhalá, Santiago'),
('RD Smart Solutions', '809-555-2007', 'info@rdsmart.com', 'Av. Luperón, Santo Domingo Oeste'),
('TechZone Dominicana', '809-555-2008', 'atencion@techzone.com.do', 'Calle Independencia, Baní'),
('Digital Pro Solutions', '809-555-2009', 'support@digitalpro.com.do', 'Av. 27 de Febrero, Santo Domingo'),
('Nube RD Technologies', '809-555-2010', 'nube@nube-rd.com', 'Calle Principal, San Pedro de Macorís');

INSERT INTO productos (nombre_producto, precio_producto, cantidad_producto, fecha_producto, estado, id_proveedor) VALUES
('Laptop Lenovo Ideapad 4', 32500.00, 15, NOW(), 'A', 1),
('Router TP-Link AC1200', 2750.00, 30, NOW(), 'A', 2),
('Disco SSD Kingston 480GB', 4200.00, 20, NOW(), 'A', 3),
('Monitor Samsung 24” FHD', 8800.00, 10, NOW(), 'A', 4),
('Teclado Mecánico Redragon', 3450.00, 25, NOW(), 'A', 5),
('Mouse Inalámbrico Logitech M185', 1150.00, 50, NOW(), 'A', 6),
('Memoria RAM DDR4 8GB', 2800.00, 35, NOW(), 'A', 7),
('Cámara de Seguridad Dahua', 6250.00, 12, NOW(), 'A', 8),
('Impresora HP Ink Tank 415', 10200.00, 8, NOW(), 'A', 9),
('Tablet Samsung Galaxy Tab A7', 14900.00, 5, NOW(), 'A', 10);


select * from productos;

DROP PROCEDURE IF EXISTS SP_Registrar_productos;
DELIMITER //
CREATE PROCEDURE SP_Registrar_productos(

IN p_nombre_producto varchar(150)

)
BEGIN
INSERT INTO `productos`( `nombre_producto`) 
VALUES ( p_nombre_producto);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS SP_Listar_productos;
DELIMITER //
CREATE PROCEDURE SP_Listar_productos()
BEGIN
SELECT `id_producto`, `nombre_producto`, `precio_producto`, `cantidad_producto`, 
`fecha_producto`, `fecha_actualizacion_producto`, `fecha_eliminacion_producto`, `estado`, 
`id_proveedor`
FROM `productos`;
END //
DELIMITER ;

call 

DROP PROCEDURE IF EXISTS SP_productos_Por_Codigo;
DELIMITER //
CREATE PROCEDURE SP_productos_Por_Codigo(
IN p_id_producto int(11))
BEGIN
SELECT `id_producto`, `nombre_producto`, `fecha_producto`, `fecha_actualizacion_producto`, 
`fecha_eliminacion_producto`, `estado`
FROM `productos`
WHERE `id_producto` = p_id_producto;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS SP_Actualizar_productos;
DELIMITER //
CREATE PROCEDURE SP_Actualizar_productos(
IN p_id_producto int(11), 
IN p_nombre_producto varchar(150)
)
BEGIN
UPDATE `productos` 
SET `nombre_producto` = p_nombre_producto
WHERE `id_producto` = p_id_producto;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS SP_Borrar_productos;
DELIMITER //
CREATE PROCEDURE SP_Borrar_productos(
IN p_id_producto int(11))
BEGIN
DELETE FROM `productos`
WHERE `id_producto` = p_id_producto;
END //
DELIMITER ;