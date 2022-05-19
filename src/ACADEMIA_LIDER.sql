CREATE DATABASE academia_lider;

USE academia_lider;

CREATE TABLE catalogo_grados_academicos(
codigo int primary key identity,
nombre varchar(100));

CREATE TABLE catalogo_profesiones(
codigo int primary key identity,
nombre varchar(100));

CREATE TABLE catalogo_ciudades(
codigo int primary key identity,
nombre varchar(100));

CREATE TABLE catalogo_modalidades(
codigo int primary key identity,
nombre varchar(100));

CREATE TABLE participantes(
codigo varchar(8) primary key,
nombres varchar(100),
ap_paterno varchar(80),
ap_materno varchar(80),
ci varchar(15) unique,
cod_grado int,
cod_ciudad int,
correo varchar(100),
telefono int,
fecha_nac date,
cod_profesion int,
foto image,
constraint fk_cod_grado foreign key (cod_grado) references catalogo_grados_academicos(codigo),
constraint fk_cod_profesion foreign key (cod_profesion) references catalogo_profesiones(codigo), 
constraint fk_cod_ciudad foreign key (cod_ciudad) references catalogo_ciudades(codigo)
);

CREATE TABLE docentes(
codigo varchar(8) primary key,
ci varchar(15) unique,
nombres varchar(100),
ap_paterno varchar(80),
ap_materno varchar(80),
cod_grado int,
cod_profesion int,
cuenta_bancaria varchar(20) unique,
correo varchar(100),
telefono int,
cod_ciudad int,
constraint fk_grado_docente foreign key (cod_grado) references catalogo_grados_academicos(codigo),
constraint fk_profesion_docente foreign key (cod_profesion) references catalogo_profesiones(codigo), 
constraint fk_ciudad_docente foreign key (cod_ciudad) references catalogo_ciudades(codigo));

CREATE TABLE eventos(
codigo varchar(8) primary key,
nombre varchar(200),
cod_modalidad int,
carga_horaria smallint,
fecha_inicio date,
fecha_final date,
cod_ciudad int,
estado varchar(15),
cod_docente varchar(8),
constraint fk_ciudad_eventos foreign key (cod_ciudad) references catalogo_ciudades(codigo),
constraint fk_modalidad_eventos foreign key (cod_modalidad) references catalogo_modalidades(codigo),
constraint fk_docente_eventos foreign key (cod_docente) refereCinces docentes(codigo));

CREATE TABLE inscripcion(
codigo int primary key identity,
cod_participante varchar(8),
cod_evento varchar(8),
fecha date,
nota smallint
constraint fk_partipante_inscripcion foreign key (cod_participante) references participantes(codigo),
constraint fk_evento_inscripcion foreign key (cod_evento) references eventos(codigo));

CREATE TABLE usuarios(
codigo int primary key identity,
nombre_completo varchar(200),
usuario varchar(80) unique,
contrasena varchar(200)
correo varchar(200));

CREATE SEQUENCE seq_participante as int start with 1 increment by 1 minvalue 1;
CREATE SEQUENCE seq_evento as int start with 1 increment by 1 minvalue 1;
CREATE SEQUENCE seq_docente as int start with 1 increment by 1 minvalue 1;

 insert into usuarios (nombre_completo,usuario,contrasena,correo)  values ('juan mamani mamni','admin',ENCRYPTBYPASSPHRASE('password','123'),'juan@gmail.com');