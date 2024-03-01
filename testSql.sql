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

/* VIEWS en SQL */
CREATE VIEW v_mayores_de_25 AS
SELECT * FROM users WHERE edad > 25;

SELECT * FROM v_mayores_de_25;

CREATE VIEW v_invitacion_concierto_reggaeton AS
SELECT * FROM users WHERE musica = "reggaeton"


SELECT * FROM v_invitacion_concierto_reggaeton

CREATE VIEW v_nombres_completos AS
SELECT nombres, apellidos FROM users

SELECT * FROM v_nombres_completos

CREATE VIEW v_usuarios_por_pais AS
SELECT pais, COUNT(*) AS cantidad_por_pais FROM users GROUP BY pais;

SELECT * FROM v_usuarios_por_pais

CREATE VIEW v_orden_por_edad AS
SELECT * FROM users ORDER BY edad DESC;

SELECT * FROM v_orden_por_edad

/* PROCEDIMIENTOS ALMACENADOS */
DELIMITER //
CREATE PROCEDURE insertar_persona(
    IN nombre VARCHAR(255), 
    IN apellido VARCHAR(255), 
    IN correo VARCHAR(255), 
    IN edad INT, 
    IN genero VARCHAR(255), 
    IN pais VARCHAR(255), 
    IN musica VARCHAR(255))
BEGIN
  INSERT INTO users (nombres, apellidos, correo, edad, genero, pais, musica) 
  VALUES (nombre, apellido, correo, edad, genero, pais, musica);
END //
DELIMITER ;

CALL insertar_persona('Manuela', 'Torres', 'manuela@gmail.com', 30, 'M', 'colombia', 'rock');

SELECT * FROM users WHERE nombres = 'Manuela';

DELIMITER //

CREATE PROCEDURE actualizar_usuario(
    IN id INT,
    IN nombres VARCHAR(255),
    IN apellidos VARCHAR(255),
    IN correo VARCHAR(255),
    IN edad INT,
    IN genero VARCHAR(255),
    IN pais VARCHAR(255),
    IN musica VARCHAR(255)
)
BEGIN
    UPDATE users
    SET nombres = nombres,
        apellidos = apellidos,
        correo = correo,
        edad = edad,
        genero = genero,
        pais = pais,
        musica = musica
    WHERE id = id;
END //


DELIMITER ;

CALL actualizar_usuario(20001, 'NuevoNombre', 'NuevoApellido', 'NA', 30, 'NuevoGenero', 'NuevoPais', 'NuevaMusica');


DELIMITER //
CREATE PROCEDURE actualizar_nombres(IN persona_id INT, IN nuevo_nombre VARCHAR(255))
BEGIN
  UPDATE users SET nombres = nuevo_nombre WHERE id = persona_id;
END //
DELIMITER 

CALL actualizar_nombres (20001,"Manuelita")

SELECT * FROM users WHERE nombres = 'Manuelita';

DELIMITER //
CREATE PROCEDURE actualizar_musica(IN persona_id INT, IN nueva_musica VARCHAR(255))
BEGIN
  UPDATE users SET musica = nueva_musica WHERE id = persona_id;
END //
DELIMITER ;

CALL actualizar_musica (1,"despecho")

DELIMITER //
CREATE PROCEDURE obtener_usuario_por_correo(IN correo_buscar VARCHAR(255))
BEGIN
  SELECT * FROM users WHERE correo = correo_buscar;
END //
DELIMITER ;

CALL obtener_usuario_por_correo("manuela@gmail.com")

SELECT * FROM users WHERE correo = 'manuela@gmail.com';

DELIMITER //

CREATE PROCEDURE eliminar_usuario(
    IN user_id INT
)
BEGIN
    DELETE FROM users
    WHERE id = user_id;
END //

DELIMITER ;



