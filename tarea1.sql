CREATE TABLE estudiantes_riwi (
    estudianteId INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
    
);

CREATE TABLE materias (
    materiaId INT PRIMARY KEY AUTO_INCREMENT,
    nombreMateria VARCHAR(50)
);

INSERT INTO estudiantes_riwi (nombre) VALUES
('Jhon'),
('Simon'),
('Pablo'),
('Jose'),
('Pedro'),
('Santiago'),
('Sebas'),
('Miguel'),
('Samuel'),
('Camilo');


SELECT * FROM estudiantes_riwi

INSERT INTO materias (nombreMateria) VALUES
('ingles'),
('español'),
('matematicas'),
('artistica'),
('civica'),
('etica'),
('estadistica'),
('geometria'),
('ciencias'),
('quimica');

SELECT * FROM materias

CREATE TABLE notas (
    estudianteId INT(50),
    materiaId INT(50),
    nota DECIMAL(4,2),
    FOREIGN KEY (estudianteId) REFERENCES estudiantes_riwi(estudianteId),
    FOREIGN KEY (materiaId) REFERENCES materias(materiaId)
);


SELECT * FROM notas

INSERT INTO notas (estudianteId, materiaId, nota) VALUES
(2, 1, 7.8),
(2, 2, 6.5),
(2, 3, 8.0),
(3, 4, 9.0),
(3, 5, 7.5),
(3, 6, 8.7),
(4, 7, 8.2),
(4, 8, 7.3),
(4, 9, 9.5),
(5, 10, 6.8),
(5, 1, 8.9),
(5, 2, 7.6),
(6, 3, 9.3),
(6, 4, 7.8),
(6, 5, 8.1),
(7, 6, 6.7),
(7, 7, 8.4),
(7, 8, 9.1),
(8, 9, 7.9),
(8, 10, 8.6),
(8, 1, 9.0),
(9, 2, 8.3),
(9, 3, 7.2),
(9, 4, 9.4),
(10, 5, 6.5),
(10, 6, 8.8),
(10, 7, 7.7);

SELECT * FROM notas

SELECT estudiantes_riwi.nombre, materias.nombreMateria, notas.nota
FROM notas
JOIN estudiantes_riwi ON notas.estudianteId = estudiantes_riwi.estudianteId
JOIN materias ON notas.materiaId = materias.materiaId;