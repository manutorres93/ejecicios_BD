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

ALTER TABLE vehiculos MODIFY placa VARCHAR(45) UNIQUE; 