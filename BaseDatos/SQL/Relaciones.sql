-- ejercicio
/**
 *tabla direcciones
 *id, nombre, numero, ciudad 
 *
 *agregar a todas las tablas la relacion 
 *administrativos, estudiantes, tecnicos, profesores(fk)
 *
 *2 inserciones en las tablas 
 ***/

-- creando la tabla direcciones
create table direcciones(
	id int primary key not null auto_increment,
	nombre varchar(100) not null,
	numero int not null,
	ciudad varchar(100) not null
);

-- insertando
insert into direcciones (nombre, numero, ciudad)
values ("Santa Elena", 1722, "Santiago"), ("Cartagena", 2, "Santiago"),
("Siempre viva", 22, "Macul");

-- agregar la fk
-- crearla la fk en estudiantes
alter table estudiantes 
add direcciones_id int;
-- relacionando
alter table estudiantes
add foreign key (direcciones_id) references direcciones(id);
-- crearla la fk en estudiantes
alter table administrativos  
add direcciones_id int;
-- relacionando
alter table administrativos 
add foreign key (direcciones_id) references direcciones(id);
-- crearla la fk en estudiantes
alter table profesores  
add direcciones_id int;
-- relacionando
alter table profesores  
add foreign key (direcciones_id) references direcciones(id);
-- crearla la fk en estudiantes
alter table tecnicos  
add direcciones_id int;
-- relacionando
alter table tecnicos  
add foreign key (direcciones_id) references direcciones(id);

update estudiantes set direcciones_id = 1
where id = 1;
update estudiantes set direcciones_id = 2
where id = 2;
update estudiantes set direcciones_id = 3
where id = 3;
update estudiantes set direcciones_id = 2
where id = 4;

insert into administrativos (nombre, apellido, direcciones_id)
values ("Marta", "Lopez", 3), ("Jorge", "Orellana", 1), ("Maria", "Arriaga", 1);

insert into profesores (nombre, apellido, direcciones_id)
values ("Israel", "Palma",3), ("Alejandro", "Heredia", 1), ("Andrea", "Montecinos",2);

insert into tecnicos(nombre, apellidos, direcciones_id)
values ("Marco", "Polo", 2), ("Jasmin", "Vela", 3), ("Javier", "Bozo", 3);


