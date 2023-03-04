use library;

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

