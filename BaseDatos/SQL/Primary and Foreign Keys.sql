-- insertar datos en tabla
-- estructura: insert into nombre_tabla (nombre_columna1, nombre_columna2...) values(valor1, valor2..);

create table generationc2.directivos(
	id int not null auto_increment,
	nombre varchar(100) not null,
	apellido varchar(100) not null,
	primary key (id)
);

insert into directivos ( nombre, apellido)
values ("Maggie", "Fernandez");
insert into directivos (nombre, apellido)
values ("Rafael", "Guerrero");

-- consultar
-- * trae todos, el where trae un registro especifico
select *
from directivos
where id = 2;
select *
from directivos
where id = 1;

-- Insertar más de un registro
insert into directivos (nombre, apellido)
values ("Andrea", "Soto"), ("Andrea", "Montecinos");

-- Modificar la data
-- drop database generationc2 -> elimina toda la base de datos

-- eliminar la tabla y su contenido, no se recupera
drop table directivos;

-- eliminar el contenido de una tabla, no elimina la tabla
truncate table directivos; 

-- modificar una columna especifica(dato especifico)
-- update nombre_tabla set nombre_columna = el_nuevo_dato where condicion
update directivos set nombre = "Laura" where id = 1;
-- mostrar toda la tabla directivos
select * from directivos;

-- mostrar columnas especificas
select id, apellido
from directivos; 

-- alias ( con las columnas se pone as, con la tabla no es necesario)
select dire.nombre as gato, dire.id as rut
from directivos dire; 

-- filtrar
select dire.nombre, dire.apellido, dire.id 
from directivos dire
where dire.nombre = "Andrea"
and dire.apellido = "montecinos"; -- si hay más de un nombre igual trae todos
-- si se hace por el id que es primary key solo trae uno

-- insertando
insert into directivos (nombre, apellido)
values ("Anne", "Green");
insert into directivos (nombre, apellido)
values ("Ani", "Mora"), ("Andres", "Vilchez");

-- filtrar por parte palabra / numero; like coincidencias
select dire.nombre, dire.apellido, dire.id
from directivos dire
where dire.nombre like '%a'; -- ('an%')  anne, andrea, andres ..
-- ('%a') comienza con cualquier texto, pero finaliza con 

-- busca la coincidencia en cualquier parte de la palabra
select dire.nombre, dire.apellido, dire.id
from directivos dire
where dire.nombre like '%afa%';

select dire.nombre, dire.apellido, dire.id
from directivos dire
where dire.nombre like 'a%'
and dire.nombre like '%e';

select dire.nombre, dire.apellido, dire.id
from directivos dire
where dire.apellido like'%o'
and dire.nombre like 'a%';

create table generationc2.curso(
	id int not null auto_increment,
	nombre varchar(100) not null,
	cantidad_alumnos int not null,
	especialidad varchar(100),
	primary key (id)
);
-- insertar tabla curso
insert into curso (nombre, cantidad_alumnos, especialidad)
values ("Cohorte 1", 30, "Java"), ("Cohorte 2", 34, "Java"),("Cohorte 3", 35, "Java");
-- ver los registros de la tabla curso
select * from curso;
-- agregar la fk a estudiantes
-- 1. creacion de columna
alter table estudiantes 
add curso_id int; 
-- 2. relacionen las tablas
alter table estudiantes 
add foreign key(curso_id) references curso(id);
-- en () donde se colocara, referencia en la tabla curso especificamente en columna id

-- insertar 
INSERT into estudiantes 
(nombre,apellido,curso_id)
values ("Jhon","Doe",1),
("Jane","Doe",2),
("Ayun","Doe",2),
("Zoe","Doe",3);

select * from estudiantes;

