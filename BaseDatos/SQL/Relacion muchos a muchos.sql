-- relación muchos a  muchos 

create table productos(
	id int not null primary key auto_increment,
	nombre varchar(100) not null,
	descripcion varchar(100) not null
);

insert into productos (nombre, descripcion)
values ("aceite de oliva", "Aceite vegetal hecho base olivos"),
("mantequilla", "Mantequilla untable natural"),
("aceite de coco", "Aceite vegetal hecho con pulpa de coco"),
("mantequilla de maní", "Elaborada a base de cacahuate tostado y molido"),
("hamburguesa de carne","Elaborada con carne de primera"),
("hamburguesa de pollo","Hecha a base de pechuga molida");

create table pedidos(
	id int not null primary key auto_increment,
	fecha date not null,
	monto int not null,
	cliente_id int not null
);

-- tabla intermedia o relacional -> el nombre que se ordene por orden alfabetico
-- pedidos_productos
-- id, fk tabla 1, fk tabla 2 -> estructura básica
-- id , pedido_id, producto_id

create table pedidos_productos(
	id int not null primary key auto_increment,
	pedido_id int not null, 
	producto_id int not null, 
	foreign key(pedido_id) references pedidos(id),
	foreign key(producto_id) references productos(id)
);


-- insertando a pedidos

insert into pedidos(fecha, monto) values('2022,06,01', 123);
insert into pedidos(fecha, monto) values('2022,06,02', 123);
insert into pedidos(fecha, monto) values('2022-06-02 00:00:00', 123);

-- insertando tabla relacional

insert into pedidos_productos (pedido_id, producto_id)
values (1,1), (1,1);

-- agregando columnas
alter table pedidos_productos 
add cant_productos int, add subtotal int;

alter table productos 
add valor_unitario int;