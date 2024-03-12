/* Query utilizada */

CREATE TABLE categorias(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombre_categoria VARCHAR(45)
)

CREATE TABLE productos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre_producto VARCHAR(45),
  categorias_id INT
)

CREATE TABLE detalles_pedido(
  id INT PRIMARY KEY AUTO_INCREMENT,
  cantidad INT,
  productos_id INT
)

CREATE TABLE pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  clientes_id INT,
  detalles_pedido_id INT,
  estado_pedido_id INT
)

ALTER TABLE pedidos DROP COLUMN estado_pedido

CREATE TABLE estado_pedido(
  id INT AUTO_INCREMENT PRIMARY KEY,
  estado VARCHAR(45)
)

CREATE TABLE clientes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre_cliente VARCHAR(250),
  apellido_cliente VARCHAR(250),
  celular_cliente VARCHAR(250)
)

ALTER TABLE productos ADD FOREIGN KEY (categorias_id) REFERENCES categorias(id)

ALTER TABLE detalles_pedido ADD COLUMN pedidos_id INT

ALTER TABLE detalle_pedido ADD FOREIGN KEY (productos_id) REFERENCES productos(id)

ALTER TABLE detalles_pedido ADD FOREIGN KEY (pedidos_id) REFERENCES pedidos(id)

ALTER TABLE pedidos ADD FOREIGN KEY (clientes_id) REFERENCES clientes(id)

ALTER TABLE pedidos ADD FOREIGN KEY (detalles_pedido_id) REFERENCES detalles_pedido(id)

/* ALTER TABLE detalle_pedido RENAME TO detalles_pedido;  */

ALTER TABLE pedidos ADD FOREIGN KEY (estado_pedido_id) REFERENCES estado_pedido(id)

INSERT INTO categorias (nombre_categoria) VALUES ("aseo"), ("verduras"),("frutas")

SELECT * FROM  detalles_pedido

INSERT INTO estado_pedido (estado) VALUES ("enviado"), ("no enviado")

INSERT INTO clientes (nombre_cliente, apellido_cliente, celular_cliente) VALUES ("Manuela", "Torres","123"),("Valentina", "Pelaez", "987")

INSERT INTO productos(nombre_producto,categorias_id) VALUES ("jabon",1), ("manzana",2),("lechuga",3),("shampoo",1)

INSERT INTO detalles_pedido(cantidad,productos_id) VALUES (10,2), (5,1)

SHOW CREATE TABLE pedidos;

ALTER TABLE pedidos
DROP FOREIGN KEY pedidos_ibfk_2;


SELECT* FROM detalles_pedido

ALTER TABLE pedidos
DROP COLUMN detalles_pedido_id;

INSERT INTO pedidos (clientes_id,estado_pedido_id) VALUES (1,1),(2,2),(1,2)

INSERT INTO detalles_pedido (cantidad, productos_id, pedidos_id) VALUES (10,1,1),(5,2,1),(2,3,2)

INSERT INTO detalles_pedido (cantidad, productos_id, pedidos_id) VALUES (12,3,3)

SELECT detalles_pedido.id, detalles_pedido.cantidad, productos.nombre_producto,
pedidos.id AS id_de_pedido, pedidos.clientes_id, clientes.nombre_cliente, estado_pedido.estado
FROM detalles_pedido 
INNER JOIN productos 
INNER JOIN pedidos 
INNER JOIN clientes 
INNER JOIN estado_pedido
WHERE detalles_pedido.productos_id=productos.id 
AND detalles_pedido.pedidos_id=pedidos.id 
AND pedidos.clientes_id=clientes.id
AND pedidos.estado_pedido_id=estado_pedido.id