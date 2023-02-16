-- Portafolio Modulo 5:
-- Crear un modelo de base de datos y ejecutar operaciones en la misma, 
-- que simulen los procesos de compra del frontend, y el registro/creación 
-- de usuarios del mismo. Se debe guardar la información de compra de cada usuario.

-- CREACIÓN DE TABLAS DE LA BASE DE DATOS Portafolio_5

-- CREACIÓN DE TABLA USUARIOS, campos: id (clave primaria), nombre, email y password
-- La tabla contendrá todos los usuarios que son los compradores de productos.
create table usuarios(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	password VARCHAR(50) NOT NULL
);

-- CREACIÓN DE TABLA PRODUCTOS, campos: id (clave primaria), nombre, descripcion,
-- stock, precio y categoria
-- La tabla contendrá todos los productos definidos para la venta
create table productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(50) NOT NULL,
	stock INT NOT NULL DEFAULT 0 CHECK(stock >= 0),
	precio DECIMAL NOT NULL CHECK(precio >= 0),
	categoria VARCHAR(50)
);

-- CREACIÓN DE TABLA BOLETAS, campos: numero_boleta (clave primaria), fecha,
-- id_usuario (llave foránea correspondiente al campo id de la tabla usuarios)
-- La tabla contendrá el registro de todas las compras realizadas por los usuarios.
create table boletas(
	numero_boleta INT PRIMARY KEY,
	fecha DATE NOT NULL,
	id_usuario INT ,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- CREACIÓN DE TABLA DETALLE_BOLETA, campos: id (clave primaria),
-- cantidad, precio,
-- id_producto (llave foránea correspondiente al campo id de la tabla productos), 
-- numero_boleta (llave foránea correspondiente al campo numero_boleta de la tabla boletas),
-- La tabla contendrá el registro de todos los detalles de productos comprados en cada boleta. 
create table detalle_boleta(
	id SERIAL PRIMARY KEY,
	numero_boleta INT NOT NULL,
	id_producto INT NOT NULL,
	cantidad INT NOT NULL,
	precio DECIMAL NOT NULL CHECK(precio >= 0),
	FOREIGN KEY(numero_boleta) REFERENCES boletas(numero_boleta),
	FOREIGN KEY(id_producto) REFERENCES productos(id)
);


-- Insertar usuarios
-- Se insertarán 5 clientes compradores, en la tabla usuarios.
--(nombre, correo y una clave de acceso)

insert into usuarios(nombre, email, password) VALUES('José', 'jose@gmail.com', '1234567');
insert into usuarios(nombre, email, password) VALUES('Pedro', 'pedro@gmail.com', '1234567');
insert into usuarios(nombre, email, password) VALUES('Ana', 'ana@gmail.com', '1234567');
insert into usuarios(nombre, email, password) VALUES('Carla', 'carla@gmail.com', '1234567');
insert into usuarios(nombre, email, password) VALUES('Helga', 'helga.com', '1234567');

-- Insertar productos
-- Inserción de 15 productos en la tabla productos
-- (Nombre del producto, descripción, stock, precio y categoría)
insert into productos(nombre, descripcion, stock, precio, categoria) VALUES
('Yoghurt','Frutilla',50, 300,'Lacteos'),
('Leche','Descremada',100,600,'Lacteos'),
('Lavalozas','Concentrado',30,1200,'Detergentes'),
('Escobillón','Cerdas duras',45,2000,'Útiles de aseo'),
('Papel higiénico','Doble hoja',45,2000,'Útiles de aseo'),
('Coca Cola','2 Lt. light',130,1700,'Bebidas'),
('Fanta','2 Lt. light',150,1700,'Bebidas'),
('Gato negro','1 Lt. tinto',80,3000,'Vinos'),
('Bolsas de basura Superior','Paquete de 20 bolsas',128,1500,'Bolsas de basura'),
('Pasas','Corinto',114,2000,'Frutos secos'),
('Galletas Tritón','Vainilla',85,1000,'Galletas'),
('Fósforos Andes','Paquete de 12 cajas',120,1800,'Fósforos'),
('Agua mineral','Dos litros',130,1500,'Aguas'),
('Pasta de dientes Colgate','Envase 175 gramos',95,2000,'Pasta de dientes'),
('Cepillo de dientes Dento','Cerda dura',50,1700,'Cepillos de diente')


--Inserción de boletas de compras del usuario 1. 

	INSERT INTO boletas(numero_boleta, fecha,id_usuario) VALUES
	(10001,'02/11/2022',1),
	(10002,'06/11/2022',1),
	(10003,'05/12/2022',1),
	(10004,'16/12/2022',1),
	(10005,'20/12/2022',1),
	(10006,'27/12/2022',1)
	
	
--Inserción de boletas de compras del usuario 2.

	INSERT INTO boletas(numero_boleta, fecha,id_usuario) VALUES
	(20001,'05/11/2022',2),
	(20002,'16/11/2022',2),
	(20003,'01/12/2022',2),
	(20004,'13/12/2022',2),
	(20005,'15/12/2022',2),
	(20006,'22/12/2022',2),
	(20007,'25/12/2022',2)	

--Inserción de boletas de compras del usuario 3.

	INSERT INTO boletas(numero_boleta, fecha,id_usuario) VALUES
	(30001,'01/12/2022',3),
	(30002,'10/12/2022',3),
	(30003,'14/12/2022',3),
	(30004,'21/12/2022',3),
	(30005,'27/12/2022',3)	
	
	
--Inserción de boletas de compras del usuario 4.

	INSERT INTO boletas(numero_boleta, fecha,id_usuario) VALUES
	(40001,'10/12/2022',4),
	(40002,'14/12/2022',4),
	(40003,'21/12/2022',4),
	(40004,'27/12/2022',4)	


--Inserción de boletas de compras del usuario 5.

	INSERT INTO boletas(numero_boleta, fecha,id_usuario) VALUES
	(50001,'05/11/2022',5),
	(50002,'01/12/2022',5),
	(50003,'07/12/2022',5),
	(50004,'14/12/2022',5),
	(50005,'18/12/2022',5),
	(50006,'24/12/2022',5),
	(50007,'30/12/2022',5)

--Detalle de boletas de compras del usuario 1.

	INSERT INTO detalle_boleta(numero_boleta, id_producto, cantidad, precio)VALUES
 (10001, 6, 2, 1700),
 (10001, 8, 1, 1200),
 (10001, 11, 3, 1700),
 (10001, 12, 7, 1700),
 (10001, 14, 2, 2000),

 (10002, 7, 1, 600),
 (10002, 9, 2, 2000),
 (10002, 10, 4, 2000),
 (10002, 11, 3, 1700),
 
 (10003, 7, 1, 600),
 (10003, 8, 2, 1200),
 (10003, 12, 4, 1700),
 (10003, 13, 3, 3000),
 
 (10004, 6, 2, 300),
 (10004, 8, 1, 1200),
 (10004, 7, 3, 600),
 (10004, 11, 7, 1700),
 (10004, 13, 2, 3000),
 
 (10005, 10, 2, 2000),
 (10005, 11, 1, 1700),
 (10005, 12, 3, 1700),

 
 (10006, 11, 2, 1700),
 (10006, 12, 1, 1700),
 (10006, 13, 3, 3000),
 (10006, 14, 7, 1500)


--Detalle de boletas de compras del usuario 2.

INSERT INTO detalle_boleta(numero_boleta, id_producto, cantidad, precio)VALUES
 (20001, 2, 4, 1700),
 (20001, 4, 1, 1200),
 (20001, 6, 2, 1700),
 (20001, 10, 3, 1700),


 (20002, 3, 1, 600),
 (20002, 5, 2, 2000),
 (20002, 9, 3, 2000),
 (20002, 15, 1, 1700),
 (20002, 13, 1, 1700),
  
  
 (20003, 4, 1, 600),
 (20003, 5, 2, 1200),
 (20003, 6, 3, 1700),
 (20003, 9, 2, 3000),
 
 (20004, 6, 2, 300),
 (20004, 7, 1, 1200),
 (20004, 8, 1, 600),
 (20004, 12, 4, 1700),
 (20004, 14, 1, 3000),
 
 (20005, 10, 2, 2000),
 (20005, 11, 1, 1700),
 (20005, 12, 5, 1700),
 (20005, 13, 4, 1700),
 (20005, 14, 2, 1700),
 
 (20006, 1, 4, 1700),
 (20006, 3, 1, 1700),
 (20006, 5, 1, 3000),
 (20006, 7, 3, 1500),

 (20007, 9, 2, 1700),
 (20007, 11, 1, 1700),
 (20007, 13, 3, 3000),
 (20007, 15, 2, 1500)


--Detalle de boletas de compras del usuario 3.

INSERT INTO detalle_boleta(numero_boleta, id_producto, cantidad, precio)VALUES
 (30001, 2, 4, 1700),
 (30001, 4, 1, 1200),
 (30001, 6, 2, 1700),
 (30001, 10, 3, 1700),


 (30002, 3, 1, 600),
 (30002, 5, 2, 2000),
 (30002, 9, 3, 2000),
 (30002, 15, 1, 1700),
 (30002, 13, 1, 1700),
  
  
 (30003, 4, 1, 600),
 (30003, 5, 2, 1200),
 (30003, 6, 3, 1700),
 (30003, 9, 2, 3000),
 
 (30004, 6, 2, 300),
 (30004, 7, 1, 1200),
 (30004, 8, 1, 600),
 (30004, 12, 4, 1700),
 (30004, 14, 1, 3000),
 
 (30005, 10, 2, 2000),
 (30005, 11, 1, 1700),
 (30005, 12, 5, 1700),
 (30005, 13, 4, 1700),
 (30005, 14, 2, 1700),


--Detalle de boletas de compras del usuario 4.

INSERT INTO detalle_boleta(numero_boleta, id_producto, cantidad, precio)VALUES
 (40001, 2, 4, 1700),
 (40001, 3, 1, 1200),
 (40001, 5, 2, 1700),
 (40001, 13, 3, 1700),
 (40001, 14, 3, 1700),

 (40002, 8, 1, 600),
 (40002, 11, 2, 2000),
 (40002, 13, 3, 2000),
  
 (40003, 12, 1, 600),
 (40003, 13, 2, 1200),
 (40003, 5, 3, 1700),
 (40003, 14, 2, 3000),
 
 (40004, 2, 2, 300),
 (40004, 6, 1, 1200),
 (40004, 10, 1, 600),
 (40004, 13, 4, 1700),
 (40004, 15, 1, 3000)

--Detalle de boletas de compras del usuario 5.

INSERT INTO detalle_boleta(numero_boleta, id_producto, cantidad, precio)VALUES
 (50001, 2, 1, 1700),
 (50001, 5, 1, 1200),
 (50001, 6, 2, 1700),
 (50001, 7, 1, 1700),


 (50002, 3, 1, 600),
 (50002, 7, 2, 2000),
 (50002, 9, 3, 2000),
 (50002, 11, 3, 1700),
 (50002, 13, 1, 1700),
  
  
 (50003, 4, 1, 600),
 (50003, 9, 2, 1200),
 (50003, 11, 3, 1700),
 (50003, 15, 2, 3000),
 
 (50004, 6, 2, 300),
 (50004, 10, 1, 1200),
 (50004, 11, 1, 600),
 (50004, 12, 3, 1700),

 
 (50005, 3, 2, 2000),
 (50005, 5, 1, 1700),
 (50005, 7, 2, 1700),
 (50005, 10, 4, 1700),
 (50005, 14, 2, 1700),

 (50006, 1, 2, 300),
 (50006, 7, 1, 1200),
 (50006, 9, 1, 600),
 (50006, 11, 4, 1700),
 (50006, 14, 1, 3000),
 
 (50007, 5, 2, 2000),
 (50007, 7, 1, 1700),
 (50007, 12, 5, 1700),
 (50007, 14, 4, 1700),
 (50007, 15, 2, 1700)



 -- Cantidad de compras por producto:
select id_producto, sum(cantidad) from detalle_boleta left join boletas on detalle_boleta.numero_boleta=boletas.numero_boleta 
group by id_producto

-- Descuento del stock, para todas las compras, en la tabla productos:
select id, nombre, stock-vendido as Stock_Actualizado from productos 
left join
(select id_producto, sum(cantidad) as vendido from detalle_boleta left join boletas on detalle_boleta.numero_boleta=boletas.numero_boleta 
group by id_producto) as restSt
on id = restSt.id_producto

 
 -- Actualizar el precio de todos los productos, -20% por conceptos de oferta de verano.
 
 UPDATE productos SET precio = precio - 0.2*precio
 
  
 -- Listar todos los productos con stock crítico (Menor o igual a 5 unidades)
 
 
 select * from productos where stock <=5
 
 
-- Simular la compra de al menos 3 productos, calcular el subtotal, agregar el iva y mostrar el total de compra.
-- Para ello se muestra la siguiente consulta de la boleta 10001, correspondiente a la compra de 5 productos de José:
select numero_boleta, nombre, cantidad, round(detB.precio + detB.precio*0.19) as precio_final, cantidad*round(detB.precio + detB.precio*0.19) as Sub_Total 
from detalle_boleta detB join productos pr
on detB.id_producto = pr.id
where numero_boleta=10001



-- Mostrar el total de ventas del mes de diciembre del 2022
Select sum(cantidad*round(precio + precio*0.19)) as Total_Ventas_Dic_2022 from detalle_boleta 
 left join boletas on detalle_boleta.numero_boleta=boletas.numero_boleta  
  where fecha between '01/12/2022' and '31/12/2022'


-- Listar el comportamiento de compra del usuario que más compras   realizó durante el 2022.

select Detalle.numero_boleta, Detalle.id_producto, productos.nombre, productos.descripcion, Detalle.cantidad as cantidad, 
Detalle.precio, round(Detalle.precio + Detalle.precio*0.19) as Precio_IVA,  cantidad*round(Detalle.precio + Detalle.precio*0.19) as Valor_Total, detalle.fecha 
from (select detalle_boleta.numero_boleta, detalle_boleta.id_producto, detalle_boleta.cantidad, detalle_boleta.precio, boletas.fecha 
	  from detalle_boleta left join boletas on detalle_boleta.numero_boleta=boletas.numero_boleta 
	  where id_usuario in
		(
	  	select nomcomp.id from(
		select ib.id, ib.nombre, sum(detb.cantidad*detb.precio) as compra from (
		select id, nombre, numero_boleta from usuarios left join boletas on  id = id_usuario) as ib
		left join detalle_boleta as detb on ib.numero_boleta=detb.numero_boleta
		group by ib.id,ib.nombre
		) as nomcomp  order by compra desc limit 1
	  	)
  
	  ) as Detalle
left join productos
on Detalle.id_producto=productos.id
