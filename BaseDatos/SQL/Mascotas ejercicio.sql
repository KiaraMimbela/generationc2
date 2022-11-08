
-- Tarea crear tabla mascotas, mínimo 4 columnas, mínimo 4 inserciones, 
-- crear por medio de script
create table generationc2.mascotas(
	id int primary key not null auto_increment,
	nombre varchar(100) not null,
	raza varchar(100) not null,
	sexo varchar(100) not null);
insert into mascotas(nombre, raza, sexo) values("lula", "gato", "hembra");
insert into mascotas (nombre, raza, sexo)
values ("michin","perro","macho"), ("gordin","tortuga","macho"),("isis","gato","hembra");
