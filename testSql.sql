SHOW DATABASES;

CREATE TABLE estudiantes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(45),
    apellido VARCHAR(45),
    correo VARCHAR(150),
    fecha_nacimiento DATE
);

SELECT * FROM `estudiantes` 

SELECT nombres FROM `estudiantes`

INSERT INTO estudiantes (nombres,apellido,correo, fecha_nacimiento) VALUES ('Manuela','Torres','manuela@gmail.com','2024-01-01')

CREATE TABLE empresas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(45),
    nit VARCHAR(45),
    telefono VARCHAR(150),
    direccion VARCHAR(45)
);

CREATE TABLE vehiculos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(45),
    modelo VARCHAR(30),
    marca VARCHAR(45),
    color VARCHAR(45),
    tipo_vehiculo VARCHAR(45)
);

CREATE TABLE paises(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    poblacion VARCHAR(150)
);
CREATE TABLE ciudades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    poblacion VARCHAR(150)
);

CREATE TABLE usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(45),
    apellidos VARCHAR(45),
    correo VARCHAR(45),
    contraseña VARCHAR(45),
    edad VARCHAR(45),
    genero VARCHAR(45),
    altura VARCHAR(45),
    peso VARCHAR(45)
);


/* 1. Listado de todos los usurarios con solo los nombres,apellidos, edad que tengan 20 años */
SELECT nombres, apellidos, edad FROM `users` WHERE edad = 20;

/* 2.Listado de todas las mujeres en la base de datos que tengan entre 20 y 30 años de edad */

SELECT nombres, apellidos, edad FROM `users` WHERE edad BETWEEN 20 AND 30 AND genero="M";

SELECT nombres, apellidos, edad FROM `users` WHERE edad > 20 AND edad<30 AND genero="M";

/* Quien es la persona con menos edad en la base de datos */
SELECT nombres, apellidos, edad FROM `users` ORDER BY edad ASC LIMIT 1 ;

SELECT nombres, apellidos, edad FROM `users` WHERE edad =1;

SELECT nombres, apellidos, edad FROM `users` ORDER BY edad ASC

SELECT MIN(edad) FROM users;



/* Cuantos usuarios hay registrados en la base de datos */
SELECT COUNT(*) FROM `users`;

/* Traer los primeros 5 usuarios de la base de datos */
SELECT * FROM `users` limit 5;
/* Trar los ultimos 10 usuarios de lal base de datos */
SELECT * FROM `users` ORDER BY id DESC LIMIT 10;

/* Listar usuarios que su correo finalice en .net */

SELECT nombres, apellidos, edad,correo FROM `users`WHERE correo LIKE "%.net"

/* Listar los usuarios que no vivan en Colombia */
SELECT nombres, apellidos, edad,pais FROM `users`WHERE pais != 'colombia'

/* Listar usuarios que mno vivan en ecuador y panamà */
SELECT id,nombres, apellidos, edad,pais FROM `users` WHERE pais != 'panama' AND pais !='ecuador';

/* Cuantos (numero) son de colombia y les gusta el rock */
SELECT COUNT(*) FROM `users` where pais='colombia' and LOWER(musica) ='rock'; 

/* Actualizr el genero muscial de todos los usuarios de la base de datos de "metal" a "carranga" */
SELECT COUNT(*) FROM `users` where musica ='metal'

UPDATE users set musica= 'carranga' WHERE musica = 'metal';

SELECT COUNT(*) FROM `users` where musica ='carranga'

/* Listado de hombres que les guste la"carranga" sean de colombia y tengan entre 10 y 20 años de edad */
SELECT nombres, apellidos FROM users WHERE edad>10 AND edad<20 and genero= 'H' AND pais= 'colombia' AND musica='carranga';

/* Actualizar todos los usuarios que tengan 99 años, su nuevo genero musical favorito sera la "carranga" */

SELECT * FROM users WHERE edad=99;

UPDATE users set musica='carranga' WHERE edad=99;


/* Listas todos los usuarios que su nombre inicia con "a", "A" */

SELECT * FROM users WHERE LOWER(nombres) LIKE "a%"

SELECT * FROM users WHERE nombres LIKE "a%" and nombres LIKE "A%"

/* Listas todos los usuarios que su nombre inicia con "z", "Z" */
SELECT * FROM users WHERE LOWER(nombres) LIKE "z%"
/* Actualizar los usuarios que tengan 50 años de edad su nuevo genero musical sera NULL */

ALTER TABLE users MODIFY musica VARCHAR(250) NULL;

SELECT * FROM users;

SELECT * FROM users WHERE edad=50;

UPDATE users set musica=NULL WHERE edad=50;

-- listar todos los usuarios que su genero musical sea igual a null
SELECT * FROM users WHERE musica is NULL;


-- cual es el resultado de la suma de todas la edades de la base de datos
SELECT sum (edad) from users;

-- cuantos usuarios tenemos registrados de "ecuador"

SELECT count(*) FROM users WHERE pais="ecuador"

-- cuantos usuarios son de colombia y les gusta el vallenato
SELECT COUNT (*) FROM users WHERE pais="colombia" AND musica="vallenato" 