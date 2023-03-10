use library;
/* Creamos tabla log*/
CREATE TABLE Log(
fecha_actualizacion timestamp,
tabla_act VARCHAR(25),
operacion VARCHAR (15),
usuario VARCHAR(20) DEFAULT 'unknown'
) ;

/* 4 Triggers: */


/* Trigger para una inserción en clientes y checkea su nivel de cliente y cantidad de ejemplares en posesión*/
delimiter $$
CREATE TRIGGER insert_clientes_log
AFTER INSERT ON clientes
for each row
 begin
	IF NEW.cant_ejemplares > NEW.nivel_cliente THEN
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'No se puede insertar porque su nivel no admite la cantidad de ejemplares en posesión.'; 
	ELSE INSERT INTO log(fecha_actualizacion,tabla_act,operacion) VALUES (now(),'clientes','INSERT');
    END IF;
end$$


/*example
INSERT INTO clientes(nombre,apellidos,telefono,cant_ejemplares,direccion,email,nivel_cliente) VALUES ('Ivan','Rodriguez','5123421235',1,'52 Flick Street','ivanRo@asdk.com',2);
*/

/* Trigger para antes de eliminar en clientes*/
delimiter $$
CREATE TRIGGER delete_clientes_check
BEFORE DELETE ON clientes
for each row
 begin
	 IF OLD.cant_ejemplares > 0 THEN 
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'No se pudo eliminar fila porque todavia tiene ejemplares'; 
	END IF;
end$$

/*example
DELETE from clientes where id_cliente = 1; No te va a dejar.
*/

/* Trigger para una inserción en generos con usuario*/
delimiter $$
CREATE TRIGGER insert_generos_log
AFTER INSERT ON generos
for each row
 begin
	INSERT INTO log(fecha_actualizacion,tabla_act,operacion,usuario) VALUES (now(),'generos','INSERT',SYSTEM_USER());
end$$


/*example
insert into generos(descripcion) values ('whodunnit');
*/

/* Trigger para antes de actualizar en clientes*/
delimiter $$
CREATE TRIGGER update_clientes_check
AFTER UPDATE ON clientes
for each row
 begin
	 INSERT INTO log(fecha_actualizacion,tabla_act,operacion,usuario) VALUES (now(),'clientes','UPDATE',SYSTEM_USER());
end$$

/*example
UPDATE clientes SET cant_ejemplares = 1 where id_cliente = 8;
*/






