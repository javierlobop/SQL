/*1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre
(cadena de texto).*/
CREATE TABLE IF NOT EXISTS clientes(
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL)
/*2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes"*/
INSERT INTO public.cliente c (name)
VALUES ('John')
/*3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".*/
UPDATE public.clientes
SET NAME= 'John Doe'
WHERE ID=1
/*4. Elimina el cliente con id=1 de la tabla "Clientes"*/
DELETE FROM public.clientes
WHERE ID=1
/*5. Lee todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.clientes
/*6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id
(entero).*/
CREATE TABLE IF NOT EXISTS pedidos(
id SERIAL PRIMARY KEY,
cliente_id int NOT NULL
CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.clientes(id))
/*7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/
INSERT INTO public.pedidos (cliente_id)
VALUES (1)
/*8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".*/
UPDATE public.pedidos
SET cliente_id =2
WHERE ID=1
/*9. Elimina el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM public.pedidos
WHERE ID=1
/*10. Lee todos los pedidos de la tabla "Pedidos".*/
SELECT * FROM public.pedidos
/*11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre
(cadena de texto).*/
CREATE TABLE IF NOT EXISTS productos(
id SERIAL PRIMARY KEY,
product_name text NOT NULL)
/*12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/
INSERT INTO public.productos (product_name)
VALUES ('Camisa')
/*13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".*/
  UPDATE public.productos
  SET product_name= 'pantalon'
  WHERE ID=1
/*14. Elimina el producto con id=1 de la tabla "Productos".*/
DELETE FROM public.productos
WHERE id=1
/*15. Lee todos los productos de la tabla "Productos".*/
SELECT * FROM public.productos
/*16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y
producto_id (entero).*/
CREATE TABLE IF NOT EXISTS DetallesPedido (
    pedido_id int,
    producto_id int,
    CONSTRAINT FK_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedido(id),
    CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id)
);
/*17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla
"DetallesPedido".*/
INSERT INTO public.DetallesPedido (pedido_id,producto_id)
VALUES (1,1)
/*18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla
"DetallesPedido".*/
UPDATE public.DetallesPedido 
SET producto_id=2
WHERE pedido_id=1

/*19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/
DELETE FROM public.DetallesPedido
WHERE pedido_id = 1

/*20. Lee todos los detalles de pedido de la tabla "DetallesPedido".*/
SELECT * FROM public.detallespedido

/*21. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un inner join.*/

SELECT C.name AS "Nombre del Cliente", P.product_name AS "Producto Pedido"
FROM public.clientes AS C
INNER JOIN public.pedido Pe 
ON C.id = Pe.cliente_id
INNER JOIN public.producto P 
ON Pe.product_id = P.id;
/*22. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un left join.*/
SELECT C.name AS "Nombre del Cliente"
FROM public.clientes C
LEFT JOIN public.pedido Pe 
ON C.id = Pe.cliente_id
/*23. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un inner join.*/

SELECT P.product_name AS "Nombre del Producto"
FROM public.producto  P
LEFT JOIN public.detallespedido DP ON P.id = DP.producto_id;

/*24. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un left join.*/

SELECT P.product_name AS "Nombre del Producto"
FROM public.producto AS P
INNER JOIN public.detallespedido AS DP ON P.id = DP.producto_id;

/*25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla
"Clientes".*/
ALTER TABLE public.clientes
ADD COLUMN telefono text

/*26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de
datos a entero.*/
ALTER TABLE public.clientes
ALTER COLUMN telefono TYPE int USING telefono:: int

/*27. Elimina la columna "telefono" de la tabla "Clientes"*/
ALTER TABLE public.clientes
DROP COLUMN telefono

/*28. Cambia el nombre de la tabla "Clientes" a "Usuarios".*/
ALTER TABLE Clientes
RENAME TO Usuarios

/*29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a
"nombre_completo".*/

ALTER TABLE Usuarios
RENAME COLUMN nombre TO nombre_completo;

/*30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/
ALTER TABLE Usuarios
CONSTRAINT FK_id FOREIGN KEY (id) REFERENCES pedidos(id))