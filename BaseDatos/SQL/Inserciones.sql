--create user
CREATE USER 'nombre' @ 'localhost' IDENTIFIED BY 'Admin1234*'(contraseña);

-- dar todos los privilegios al user
GRANT ALL´PRIVILEGES ON *.* TO 'nombre' @ 'localhost' WITH GRAN OPTION;

-- asignar unos privilegios
FLUSH PRIVILEGES;

-- creación de usuario para acceso remoto
-- % : permite al usuario conectarse de manera remota
CREATE USER 'nombre' @ '%' IDENTIFIED BY 'contraseña';
GRANT ALL´PRIVILEGES ON *.* TO 'nombre' @ '%' WITH GRAN OPTION;
FLUSH PRIVILEGES;

--creacion de tabla desde consola
CREATE TABLE nombre_tabla(
	nombre_columna1 tipo_dato restricciones,
	nombre_colunma2 tipo_dato restricciones;
);

--modificando la tabla
ALERT TABLE generationc2.estudiante MODIFY COLUMN id INT primary key auto_increment NOT NUll;


--creando
create table generationc2.directivos(
	id int not null auto_increment,
	nombre varchar(100) not null,
	apellido varchar(100) not null,
	primary key (id)
);

-- describir la tabla
describe estudiantes ;
-- consultar los datos
select * from tecnicos;
select * from estudiantes;
