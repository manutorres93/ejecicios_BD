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