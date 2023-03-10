use library;

START TRANSACTION;

delete from ejemplares where id_ejemplar between 3 and 5;

rollback;

commit;

/*	Registros eliminados:

insert into ejemplares(id_ejemplar,id_libro,fecha_tomado,id_cliente) values(3,2,'2023-02-03',5);
insert into ejemplares(id_ejemplar,id_libro,fecha_tomado,id_cliente) values(4,5,'2022-11-05',6);
insert into ejemplares(id_ejemplar,id_libro,fecha_tomado,id_cliente) values(5,4,'2023-01-30',7);
*/


START TRANSACTION;

insert into generos(descripcion) values ('Fabula');
insert into generos(descripcion) values ('Leyenda');
insert into generos(descripcion) values ('Carta');
insert into generos(descripcion) values ('Ensayo');

savepoint lote_1;

insert into generos(descripcion) values ('Oda');
insert into generos(descripcion) values ('Sátira');
insert into generos(descripcion) values ('Drama');
insert into generos(descripcion) values ('Epopeya');

savepoint lote_2;


rollback to lote_1;

/*
delete from generos where id_genero between 12 and 15;
*/


