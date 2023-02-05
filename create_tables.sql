CREATE SCHEMA `library` ;

use library;

CREATE TABLE libro(
	id_libro INT,
    titulo VARCHAR(20),
    id_autor INT,
    cant_paginas INT,
    editorial VARCHAR(20),
    cant_disponible INT,
    PRIMARY KEY(id_libro));
    
CREATE TABLE genero(
id_genero INT,
descripcion VARCHAR(20),
	
    PRIMARY KEY(id_genero));
    
CREATE TABLE editorial(
id_editorial INT,
descripcion VARCHAR(20),
	
    PRIMARY KEY(id_editorial));

CREATE TABLE nacionalidad(
	id_nacionalidad INT,
    descripcion VARCHAR(20),
    
    PRIMARY KEY(id_nacionalidad));


CREATE TABLE autor(
	id_autor INT,
    nombre VARCHAR(20),
    apellidos VARCHAR(20),
    id_nacionalidad INT,
    PRIMARY KEY(id_autor),
FOREIGN KEY(id_nacionalidad) REFERENCES nacionalidad(id_nacionalidad)
	
);









ALTER TABLE libro
ADD id_genero INT,
ADD id_editorial INT,
ADD CONSTRAINT `FK_EDITORIAL` FOREIGN KEY (id_editorial) references editorial(id_editorial),
ADD CONSTRAINT `FK_AUTOR` FOREIGN KEY (id_autor) references autor(id_autor),
ADD CONSTRAINT `FK_GENERO` FOREIGN KEY (id_genero) references genero(id_genero);





CREATE TABLE cliente(
	id_cliente INT,
    nombre VARCHAR(20),
    apellidos VARCHAR(20),
    telefono INT,
    cant_ejemplares INT,
    direccion VARCHAR(20),
    email VARCHAR(30),
    nivel_cliente INT,
    PRIMARY KEY(id_cliente));


CREATE TABLE ejemplar(
	id_ejemplar INT,
    id_libro INT,
    fecha_tomado DATE,
	id_cliente INT,
    PRIMARY KEY(id_ejemplar),
    FOREIGN KEY(id_libro) REFERENCES libro(id_libro),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
    );
