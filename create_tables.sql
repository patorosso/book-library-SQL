CREATE SCHEMA `library` ;

use library;

CREATE TABLE libros(
	id_libro INT,
    titulo VARCHAR(70),
    id_autor INT,
    cant_paginas INT,
    cant_disponible INT,
    PRIMARY KEY(id_libro));
    
CREATE TABLE generos(
id_genero INT,
descripcion VARCHAR(20),
	
    PRIMARY KEY(id_genero));
    
CREATE TABLE editoriales(
id_editorial INT,
descripcion VARCHAR(20),
	
    PRIMARY KEY(id_editorial));

CREATE TABLE nacionalidades(
	id_nacionalidad INT,
    descripcion VARCHAR(20),
    
    PRIMARY KEY(id_nacionalidad));


CREATE TABLE autores(
	id_autor INT,
    nombre VARCHAR(20),
    apellidos VARCHAR(20),
    id_nacionalidad INT,
    PRIMARY KEY(id_autor),
FOREIGN KEY(id_nacionalidad) REFERENCES nacionalidades(id_nacionalidad)
	
);




ALTER TABLE libros
ADD id_genero INT,
ADD id_editorial INT,
ADD CONSTRAINT `FK_EDITORIALES` FOREIGN KEY (id_editorial) references editoriales(id_editorial),
ADD CONSTRAINT `FK_AUTORES` FOREIGN KEY (id_autor) references autores(id_autor),
ADD CONSTRAINT `FK_GENEROS` FOREIGN KEY (id_genero) references generos(id_genero);





CREATE TABLE clientes(
	id_cliente INT,
    nombre VARCHAR(20),
    apellidos VARCHAR(20),
    telefono VARCHAR(30),
    cant_ejemplares INT,
    direccion VARCHAR(20),
    email VARCHAR(30),
    nivel_cliente INT,
    PRIMARY KEY(id_cliente));


CREATE TABLE ejemplares(
	id_ejemplar INT,
    id_libro INT,
    fecha_tomado DATE,
	id_cliente INT,
    PRIMARY KEY(id_ejemplar),
    FOREIGN KEY(id_libro) REFERENCES libros(id_libro),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
    );
