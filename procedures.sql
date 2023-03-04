use library;

/* primer procedure */

drop procedure if exists `select de campo ordenado`;

delimiter $$
create procedure `select de campo ordenado`
(
/*params*/
in campo varchar(20),
in orden varchar(4)
)
begin
/* query para ordenar por el campo, todo esto en la tabla libros */
set @sentencia = concat ('select * from libros order by ',campo,' ',orden);

prepare dummy from @sentencia;
execute dummy;
deallocate prepare dummy;
end
$$
delimiter ;

call `select de campo ordenado` ('titulo',''); /* 'desc' or '' */







/* segundo procedure */


drop procedure if exists `eliminar un genero literario`;

delimiter $$
create procedure `eliminar un genero literario`
(
/*params*/
in id int
)
begin
/* borrar el genero segun id */
set @sentencia = concat ('delete from generos where  id_genero = ',id);

prepare dummy from @sentencia;
execute dummy;
deallocate prepare dummy;
end
$$
delimiter ;


call `eliminar un genero literario` (4); 




