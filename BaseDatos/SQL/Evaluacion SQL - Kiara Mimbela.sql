-- creando tablas, proveedores y productos

create table proveedores(
	id int primary key auto_increment not null,
	nombre varchar(100) not null,
	correo varchar(100),
	numero int not null,
	rut varchar(100) not null
);

create table productos(
	id int primary key auto_increment not null,
	nombre varchar(100) not null,
	descripción varchar(100),
	precio_unitario int not null,
	tipo_producto varchar(100)
);

-- tabla relacional de proveedor y productos

create table producto_proveedor(
	id int primary key not null auto_increment,
	producto_id int not null,
	proveedor_id int not null,
	cantidad int not null,
	valor_compra int not null,
	total int ,
	fecha date not null
);



-- ----------------------------------------------
-- creando tablas, usuario y carrito

create table usuario(
	id int primary key auto_increment not null,
	nombre varchar(100) not null,
	dirección varchar(100) not null,
	numero_usuario int not null
);

create table carrito(
	id int primary key auto_increment not null,
	usuario_id int not null,
	fecha date not null,
	producto_id int not null,
	cantidad_producto int not null
);

-- relacionando con fk

alter table producto_proveedor 
add foreign key (producto_id) references productos(id);
alter table producto_proveedor 
add foreign key (proveedor_id) references proveedores(id);
alter table carrito 
add foreign key (producto_id) references productos(id);
alter table carrito 
add foreign key (usuario_id) references usuario(id);

-- insertando datos 

-- ingresando productos

insert into productos (nombre, descripción, precio_unitario, tipo_producto)
values ("Arroz", "Arroz Grado 2", 1680, "Abarrotes"),
("Papel Higiénico", "Papel Higiénico Confort Doble Hoja - 25mt x 8un", 3150, "Aseo y Limpieza"),
("Leche", "Leche Entera Larga Vidda - 1lt", 950, "Lácteos"),
("Pasta Toscani", "Pasta Strozzapreti - 250gr", 4720, "Abarrotes"),
("Hamburguesa Vacuno", "Hamburguesa La Crianza de vacuno - 100gr", 990, "Congelados"),
("Aceite", "Aceite Maravilla Natura - 1,5lt", 5990, "Abarrotes");

-- ingresando proveedores

insert into proveedores (nombre, rut, numero, correo)
values ("Juan Pérez", "34568723-5", 988267525, "perez@gmail.com"),
("Mónica Sanchez", "56784521-1", 997263627, "mosanchez@gmail.com"),
("Enrique Vasquez", "14326598-0", 999235411, "enriquevasquez@gmail.com");

-- ingresando usuarios

insert into usuario(nombre, dirección, numero_usuario)
values ("Matthew Diaz", "Santa Elena 1723 - Santiago", 996543123),
("Laura Vasquez", "Av. Siempre Viva 33", 956334220),
("Christian Mimbela", "Miraflores 448 - Santiago", 909878546);

-- ingresando carrito

insert into carrito (usuario_id, fecha, producto_id, cantidad_producto)
values (2, "2022-11-10", 1, 4), (2,"2022-11-10", 3, 1),
(1, "2022-11-11", 5, 3), (3, "2022-11-14", 4, 2), (3, "2022-11-14", 6,1),
(3, "2022-11-14", 3, 1);

-- ingresando producto_proveedor
insert into producto_proveedor (producto_id, proveedor_id, cantidad, valor_unitario, fecha)
values (1, 1, 20, 600, "2022-10-26"),(4, 1, 30, 300, "2022-11-01"),
(6, 1, 15, 200, "2022-10-29"), (2, 2, 40, 900, "2022-11-09"), 
(3, 3, 20, 300, "2022-09-27"), (5, 3, 50, 300, "2022-11-01");


-- consultas

-- cuantos carritos de compra tiene el usuario Laura
select * from carrito c 
inner join usuario u 
on usuario_id = u.id 
where usuario_id = 2;

-- saber cuantos pedidos se hicieron el 2022-11-14
select * from carrito c 
where fecha = "2022-11-14";

-- saber cuantos productos hay en abarrotes
select nombre 
from productos 
where tipo_producto = "Abarrotes";

-- saber que me provee cada producto 
select * from producto_proveedor pp 
inner join proveedores p 
on proveedor_id = p.id; 

-- saber el tipo de productos que me provee el proveedor id = 2
-- resultado no optimo
select p.tipo_producto, pp.proveedor_id   from productos p 
inner join producto_proveedor pp 
on pp.producto_id != p.tipo_producto
where pp.proveedor_id  = 2; 

-- creando tabla clasificación de producto
create table clasificacion_producto(
	id int primary key not null auto_increment,
	producto_id int not null,
	proveedor_id int not null,
	tipo_producto varchar(100) not null
);

-- estableciendo fk
alter table clasificacion_producto
add foreign key (producto_id) references productos(id);
alter table clasificacion_producto
add foreign key (proveedor_id) references proveedores(id);

-- ingresando en clasificacion_productos
insert into clasificacion_producto (producto_id, proveedor_id, tipo_producto)
values (1, 1, "Abarrotes"), (2, 2, "Aseo y Limpieza"), (3, 3, "Lácteos"),
(4, 1, "Abarrotes"), (5, 3, "Congelados"), (6, 1, "Abarrotes");

-- saber el tipo de productos que me provee el proveedor id = 2
select * from clasificacion_producto cp 
where proveedor_id = 2;

-- saber cuantos productos  me provee el proveedor id = 1
select * from producto_proveedor pp 
where proveedor_id = 1;

-- obteniendo el total que se gasto para adquirir un producto, falta poner en la tabla 
select   pp.cantidad  * pp.valor_compra  total  from producto_proveedor pp ;

-- saber cuantos productos vendi el dia 10
select producto_id from carrito c
where fecha like "%10%";

select  precio_unitario - valor_compra 
from productos p,  producto_proveedor pp  ;








