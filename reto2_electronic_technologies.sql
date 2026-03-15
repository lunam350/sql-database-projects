-- Reto 2. Crear mi primera base de datos

/*Datos de identificación*/
-- Alumno: Abel Manuel Luna Meza
-- Matrícula: 24019889
-- Fecha: 13-07-2025
-- Nombre del módulo: Taller de base de datos v1
-- Asesora: Margarita Márquez Tirso

-- Crear base de datos y usarla
CREATE DATABASE store;
USE store;

-- Comprobación de creación de base de datos
SHOW DATABASES;

-- Crear tabla de sucursales (store)
CREATE TABLE store (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(50) NOT NULL
);

-- Comprobación de creación de tabla store
DESCRIBE store;

-- Crear tabla de productos (product)
CREATE TABLE product (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DOUBLE NOT NULL,
  description VARCHAR(150),
  store_id INT,
  FOREIGN KEY (store_id) REFERENCES store(id)
);

-- Comprobación de creación de tabla product
DESCRIBE product;

-- Crear tabla de clientes (client)
CREATE TABLE client (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL
);

-- Comprobación de creación de tabla client
DESCRIBE client;

-- Crear tabla de métodos de pago (payment_method)
CREATE TABLE payment_method (
  id INT AUTO_INCREMENT PRIMARY KEY,
  method VARCHAR(50) NOT NULL
);

-- Comprobación de creación de tabla payment_method
DESCRIBE payment_method;

-- Crear tabla de órdenes de compra (purchase_order)
CREATE TABLE purchase_order (
  id INT AUTO_INCREMENT PRIMARY KEY,
  client_id INT,
  payment_method_id INT,
  FOREIGN KEY (client_id) REFERENCES client(id),
  FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

-- Comprobación de creación de tabla purchase_order
DESCRIBE purchase_order;

-- Crear tabla detalle de orden de compra (order_detail)
CREATE TABLE order_detail (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES purchase_order(id),
  FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Comprobación de creación de tabla order_detail
DESCRIBE order_detail;

-- Comprobación general de todas las tablas
SHOW TABLES;

