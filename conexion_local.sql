SHOW DATABASES

USE riwi_bd

CREATE TABLE marcas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(45)
)

CREATE TABLE colores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    color VARCHAR(45)
)

CREATE TABLE tipo_vehiculo(
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_vehiculo VARCHAR(45),
    marcas_id INT
    
)

CREATE TABLE vehiculos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(45),
    tipo_vehiculo VARCHAR(45),
    placa VARCHAR(45),
    colores_id INT,
    tipo_vehiculo_id INT,
    tipo_vehiculo_marcas_id INT
)

ALTER TABLE vehiculos DROP COLUMN tipo_vehiculo_marcas_id

ALTER TABLE vehiculos MODIFY placa VARCHAR(45) UNIQUE; 

ALTER TABLE vehiculos ADD FOREIGN KEY (colores_id) REFERENCES colores(id)

ALTER TABLE vehiculos ADD FOREIGN KEY (tipo_vehiculo_id) REFERENCES tipo_vehiculo(id)

ALTER TABLE tipo_vehiculo ADD FOREIGN KEY (marcas_id) REFERENCES marcas(id)

INSERT INTO marcas (marca) VALUES ("kia"), ("hyundai")

SELECT * FROM marcas

INSERT INTO colores (color) VALUES ("rojo"), ("negro"), ("blanco")

SELECT * FROM colores

INSERT INTO tipo_vehiculo (tipo_vehiculo,marcas_id) VALUES ("moto",1), ("carro",1)

SELECT * FROM tipo_vehiculo

INSERT INTO vehiculos(modelo, placa, colores_id, tipo_vehiculo_id) VALUES 
("2014", "ABC123", 1,1 ),
("2015", "ABC124", 1,2 ),
("2015", "ABC125", 2,2 ),
("2016", "ABC126", 2,1 ),
("2017", "ABC127", 3,1 ),
("2017", "ABC128", 3,2 ),
("2019", "ABC129", 3,1 ),
("2020", "ABC121", 1,1 ),
("2020", "ABC122", 3,1 ),
("2023", "ABC120", 2,2 )

/* Me trae toda la información de las dos tablas juntas  */
SELECT * FROM vehiculos INNER JOIN colores WHERE vehiculos.colores_id=colores.id

/* Me trae la información más detallada de lo que quiero */
SELECT vehiculos.placa, vehiculos.id, colores.color FROM vehiculos INNER JOIN colores WHERE vehiculos.colores_id=colores.id

SELECT vehiculos.modelo, vehiculos.placa, colores.color, tipo_vehiculo.tipo_vehiculo, marcas.marca FROM vehiculos INNER JOIN marcas INNER JOIN colores INNER JOIN tipo_vehiculo 
WHERE vehiculos.colores_id=colores.id AND vehiculos.tipo_vehiculo_id=tipo_vehiculo.id




