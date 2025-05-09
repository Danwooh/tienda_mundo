CREATE DATABASE IF NOT EXISTS tienda_mundo;
USE tienda_mundo;

CREATE TABLE IF NOT EXISTS t_usuarios (
  id_usuario    INT(11) AUTO_INCREMENT NOT NULL,
  nombre        VARCHAR(100) NOT NULL,
  apellido      VARCHAR(100) NOT NULL,
  email         VARCHAR(200) NOT NULL,
  password      VARCHAR(200) NOT NULL,
  rol           VARCHAR(20) NOT NULL,
  imagen        VARCHAR(250) NOT NULL,
  CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
  CONSTRAINT uq_email UNIQUE (email)
) ENGINE=InnoDB;

INSERT INTO t_usuarios (nombre, apellido, email, password, rol, imagen)
VALUES ('admin', 'admin', 'admin1@admin.com', 'contasena', 'admin', 'imagenes');


-- Tabla: t_pedidos
CREATE TABLE IF NOT EXISTS t_pedidos (
  id_pedido INT(11) AUTO_INCREMENT NOT NULL,
  id_usuario INT(11) NOT NULL,
  ciudad VARCHAR(100) NOT NULL,
  direccion VARCHAR(200) NOT NULL,
  costo FLOAT(100,2) NOT NULL,
  estado VARCHAR(20) NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  CONSTRAINT pk_pedidos PRIMARY KEY (id_pedido),
  CONSTRAINT fk_pedido_usuario FOREIGN KEY (id_usuario) REFERENCES t_usuarios(id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;



-- Tabla: t_categorias
CREATE TABLE IF NOT EXISTS t_categorias (
  id_categoria INT(11) AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT pk_categorias PRIMARY KEY (id_categoria)
) ENGINE=InnoDB;


-- Tabla: t_productos
CREATE TABLE IF NOT EXISTS t_productos (
  id_producto INT(11) AUTO_INCREMENT NOT NULL,
  id_categoria INT(11) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  precio FLOAT(100,2) NOT NULL,
  stock INT(10) NOT NULL,
  oferta VARCHAR(20),
  fecha DATE NOT NULL,
  imagen VARCHAR(255),
  CONSTRAINT pk_productos PRIMARY KEY (id_producto),
  CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES t_categorias(id_categoria)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;



-- Tabla: t_lineapedidos
CREATE TABLE IF NOT EXISTS t_lineapedidos (
  id_lineapedido INT(11) AUTO_INCREMENT NOT NULL,
  id_pedido INT(11) NOT NULL,
  id_producto INT(11) NOT NULL,
  unidades INT(10) NOT NULL,
  CONSTRAINT pk_lineapedidos PRIMARY KEY (id_lineapedido),
  CONSTRAINT fk_linea_pedido FOREIGN KEY (id_pedido) REFERENCES t_pedidos(id_pedido)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_linea_producto FOREIGN KEY (id_producto) REFERENCES t_productos(id_producto)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;




