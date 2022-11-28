-- relaciones
create table proveedores(
	id int primary key not null auto_increment,
	nombre varchar(100) not null,
	rut varchar(100) not null
);

create table direccion(
	id int primary key not null auto_increment,
	calle varchar(100) not null,
	numero int not null,
	sector varchar(100) not null,
	ciudad varchar(100) not null,
	region varchar(100) not null,
	codigo_postal int,
	proveedorId int not null);

-- crear la fk de una sola aa
alter table direccion
add constraint fk_proveedor_id -- agregandole nombre a la relación
foreign key (proveedorId) references proveedores(id);

-- insertando
insert into proveedores (nombre, rut)
values ("Luisa", "676767-9"), ("Marco", "34343-3"),("Pedro", "535353-3");

insert into direccion (calle, numero, sector, ciudad, region, codigo_postal, proveedorId)
values ("buena vida", 33, "Santigo", "Santiago", "RM", 080808, 2), 
("Santa Elena", 22, "Santiago", "Santiago", "Santiago", 67676, 3),
("Arbusto", 2, "Central", "Parque", "Afuera", 676767, 1);

insert into direccion (calle, numero, sector, ciudad, region, proveedorId)
values ("Bladosa", 11, "Garden", "Red", "Road", 3);

insert into proveedores (nombre, rut) values ("Juancha", "76767676");

select * from proveedores;

select * from direccion;

-- SQL JOINs

select * from proveedores p 
inner join direccion d 
on p.id = d.proveedorId; -- trae los datos existentes 

select * from proveedores p 
inner join direccion d 
on p.id = d.proveedorId
where p.id = 3;

select d. * from proveedores p 
inner join direccion d 
on p.id = d.proveedorId
where p.id = 3;

select d.id, d.calle, d. numero, p.nombre
from proveedores p 
inner join direccion d 
on p.id = d.proveedorId
where p.id = 3;

select p. * from proveedores p 
inner join direccion d 
on p.id = d.proveedorId
where p.id = 3;


-- left join
select * 
from proveedores p 
left join direccion d 
on p.id = d.proveedorId;

-- right join
select * 
from proveedores p 
right join direccion d 
on p.id = d.proveedorId;
