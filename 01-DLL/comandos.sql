
-- Como iniciar MySql en consola

-- mysql -u root -p

-- Comando para listar las bases de datos

SHOW DATABASES;

-- Comando para crear una nueva base de datos

CREATE DATABASE nombre_bd;


-- Comando para usar una base de datos

USE nombre_bd;


-- Comando para crear una nueva tabla

CREATE TABLE coders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(40) NOT NULL,
    clan varchar(40) NOT NULL CHECK(clan IN("Lovelace","Meta"))
);


-- Comando para listar todas las tablas de mi base de datos

SHOW TABLES;

-- Comando para ver detalles de una tabla

DESC nombre_tabla;

--Comando para agregar un nuevo registro a una tabla

INSERT INTO nombre_tabla (nombre,edad) VALUES ("Test",20),("TEST2",39), ("TEST3",23);

-- Comando para listar todos los registros de una tabla

SELECT * FROM nombre_tabla;


-- Comando para alterar una tabla y agregar un nuevo campo

ALTER TABLE nombre_tabla 
ADD COLUMN nombre_atributo tipo longitud restricciones;

-- Comando para eliminar un atributo

ALTER TABLE nombre_tabla
DROP COLUMN nombre_atributo;


-- Comando para editar (cambiar el tipo de dato) un atributo

ALTER TABLE nombre_tabla
MODIFY COLUMN nombre_atributo tipo restricciones;

-- Comando para cambiar el nombre de un atributo

ALTER TABLE  nombre_tabla
CHANGE COLUMN nombre_actual_atributo nuevo_nombre tipo restricciones