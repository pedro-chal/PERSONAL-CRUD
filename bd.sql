create database crud
use crud;


create table productos(
id_producto int auto_increment primary key, 
nombre_producto varchar(150),
fecha_producto datetime,
fecha_actualizacion_producto datetime,
fecha_eliminacion_producto datetime,
estado char(1)

);

insert into productos(nombre_producto, fecha_producto,estado) 
values ('Televisores','2025/11/10','1')

select * from productos;

DROP PROCEDURE IF EXISTS SP_Registrar_productos;
DELIMITER //
CREATE PROCEDURE SP_Registrar_productos(
IN p_id_producto int(11), 
IN p_nombre_producto varchar(150), 
IN p_fecha_producto datetime, 
IN p_fecha_actualizacion_producto datetime, 
IN p_fecha_eliminacion_producto datetime, 
IN p_estado char(1)
)
BEGIN
INSERT INTO `productos`(`id_producto`, `nombre_producto`, `fecha_producto`, `fecha_actualizacion_producto`, 
`fecha_eliminacion_producto`, `estado`) 
VALUES (p_id_producto, p_nombre_producto, p_fecha_producto, p_fecha_actualizacion_producto, 
p_fecha_eliminacion_producto, p_estado);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS SP_Listar_productos;
DELIMITER //
CREATE PROCEDURE SP_Listar_productos()
BEGIN
SELECT `id_producto`, `nombre_producto`, `fecha_producto`, `fecha_actualizacion_producto`, 
`fecha_eliminacion_producto`, `estado`
FROM `productos`;
END //
DELIMITER ;

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
IN p_nombre_producto varchar(150), 
IN p_fecha_producto datetime, 
IN p_fecha_actualizacion_producto datetime, 
IN p_fecha_eliminacion_producto datetime, 
IN p_estado char(1)
)
BEGIN
UPDATE `productos` 
SET `nombre_producto` = p_nombre_producto, `fecha_producto` = p_fecha_producto, `fecha_actualizacion_producto` = p_fecha_actualizacion_producto, `fecha_eliminacion_producto` = p_fecha_eliminacion_producto, 
`estado` = p_estado
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
