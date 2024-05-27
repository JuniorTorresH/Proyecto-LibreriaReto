create database LibreriasReto;
use LibreriasReto;
set dateformat dmy

create table area
(
	idArea int primary key not null identity(1,1),
	cargo varchar(45) not null,
	sueldo decimal(10,2) not null
);
go

create table genero
(
	idGenero int primary key not null identity (1,1),
	nombre varchar(30)
);
go

create table metodoPago
(
	idMetodoPago int primary key not null identity(1,1),
	nombre varchar(25)
);
go

create table cliente
(
	idCliente int primary key not null identity(1000,1),
	dni varchar(9) not null,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	-- Campos nulos --
	esActivo bit default 1
);
go

create table empleado
(
	idEmpleado int primary key not null identity(2000,1),
	idArea int references area,
	dni varchar(9) not null,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	telefono varchar(9) not null,
	fechaIngreso date not null,
	-- Campos nulos --
	email varchar(45) null,
	direccion varchar(40) null,
	esActivo bit default 1
);
go

create table acceso
(
	idAcceso int primary key not null identity (1,1),
	idEmpleado int not null references empleado, --DNI
	clave varchar(150) not null --PASSWORD
);
go

create table libro
(
	idLibro int primary key not null identity(3000,1),
	idGenero int references genero,
	nombre varchar(50) not null,
	autor varchar(25) not null,
	editorial varchar(20) not null,
	precio int not null,
	anioPublicacion int not null,
	stock int default 0,
	esActivo bit default 1
);
go

create table recepcion
(
	idRecepcion int primary key not null identity(5000,1),
	idLibro int references libro not null,
	cantidad int not null,
	fechaIngreso date
);
go

create table comprobante
(
	idComprobante int primary key not null identity(7000,1),
	idCliente int references cliente not null,
	idEmpleado int references empleado not null,
	idMetodoPago int references metodoPago not null,
	total decimal(10,2),
	fechaVenta date default(getdate())
);
go

create table venta
(
	idVenta int primary key not null identity(6000,1),
	idComprobante int references comprobante,
	idlibro int references libro not null,
	cantidad int not null,
	precio decimal(10,2) not null,
	total decimal(10,2)
);
go

insert into area values
	('Limpieza', 1200),
	('Vendedor', 2200),
	('Almacenero', 1500),
	('Seguridad', 1700)
go

insert into genero values
	('Drama'),
	('Romance'),
	('Comedia'),
	('Terror'),
	('Suspenso'),
	('Aventura'),
	('Ficcion')
go

insert into metodoPago values
	('Efectivo'),
	('Deposito'),
	('Transferencia'),
	('Banca Movil')
go

insert into cliente values
	('72557870', 'Diego', 'Doria Crisostomo', 1),
	('72555875', 'Luis', 'Zambrano Garcia', 1),
	('16930231', 'Junior', 'Torres Hinostroza', 1)
go

insert into empleado values
	(1, '16130376', 'Diego', '�ahui Rodriguez', '924221252', '13-02-2024', 'Diego�@gamil.com', 'Barrios Altos', 1),
	(2, '16130376', 'Edwin', 'Castillo Reto', '974201252', '13-02-2024', 'EdwinC@gamil.com', 'AA.HH Vecino cuida mi calamina', 1)
go

insert into libro values
	( 5, 'El dia que se perdio la cordura', 'Javier Castillo', 'Anagrama', 78, 2014, 0, 1),
	( 1, 'La pareja de al lado', 'Shari Lapena', 'Debolsillo', 59, 2021, 0, 1),
	( 7, 'Futuro azul', 'Eoin Colfer', 'Penguin Random', 19, 2009, 0, 1),
	( 4, 'El silencio de la ciudad blanca', 'Eva Garcia Saenz', 'Editorial Planeta', 89, 2016, 0, 1)
go

select * from area;
select * from genero;
select * from metodoPago;
select * from cliente;
select * from empleado;
select * from libro;