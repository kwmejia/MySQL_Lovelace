# Creando la base de datos
CREATE DATABASE mi_conjunto;

#Usando la base de datos
USE mi_conjunto;

# Creando tabla conjunto

CREATE TABLE conjuntos (
	nit_conjunto varchar(13) PRIMARY KEY,
    nombre varchar(30) NOT NULL CHECK(nombre NOT IN("Santana","Altos","Montes")),
    estrato INT NOT NULL CHECK(estrato BETWEEN 0 AND 6)
);

#Creando tabla vigilante
CREATE TABLE vigilantes (
	ced_vigilaten varchar(10) PRIMARY KEY,
    nombre varchar(30) NOT NULL,
    fecha_nac DATE,
    genero varchar(5) NOT NULL CHECK(genero IN("M","F","Otro"))
);


#Creando la tabla edificio
CREATE TABLE edificios (
	id_edifico INT AUTO_INCREMENT PRIMARY KEY,
    nro_de_pisos INT NOT NULL CHECK(nro_de_pisos BETWEEN 5 AND 8),
    ubicacion varchar(30)
);

#Creando el campo que guardará el identificador del conjunto
ALTER TABLE edificios 
ADD COLUMN id_conjunto varchar(13) NOT NULL;

#Creando la relacion entre edificio y conjunto
ALTER TABLE edificios 
ADD CONSTRAINT fk_id_conjunto foreign key(id_conjunto)
REFERENCES conjuntos(nit_conjunto);

CREATE TABLE apartamentos (
	num_apto INT PRIMARY KEY AUTO_INCREMENT,
    piso INT NOT NULL,
	valor INT NOT NULL CHECK(valor BETWEEN 10000 AND 100000),
    id_edificio INT NOT NULL,
    CONSTRAINT fk_id_edificio2 foreign key(id_edificio)
    REFERENCES edificios(id_edifico)
);

CREATE TABLE novedades(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_vigilante varchar(10) NOT NULL,
    id_edificio INT NOT NULL,
    CONSTRAINT fk_id_vigilante foreign key(id_vigilante)
    REFERENCES vigilantes(ced_vigilaten),
    CONSTRAINT fk_id_edificio foreign key(id_edificio)
    REFERENCES edificios(id_edifico)
);


ALTER TABLE edificios 
ADD COLUMN  sector1 varchar(30) CHECK(sector IN ("Piscina","Alameda", "Cancha")),
ADD COLUMN  sector2 varchar(30) CHECK(sector IN ("Piscina","Alameda", "Cancha"))
;

CREATE TABLE banco (
	codigo int NOT NULL,
    nombre varchar(20) NOT NULL unique,
	PRIMARY KEY (codigo,nombre)
);
