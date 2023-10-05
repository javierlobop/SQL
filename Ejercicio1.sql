/* 1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).*/
CREATE TABLE IF NOT EXISTS clientes(
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email text
)
/*2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".
*/
INSERT INTO public.clientes(name,email)
VALUES('Juan','juan@example.com')

/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/
UPDATE public.clientes
SET email = 'juan@example.com'
WHERE id= 1

/*4. Eliminar el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM public.clientes
WHERE ID = 1

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).*/
CREATE TABLE IF NOT EXISTS pedidos (
    id serial PRIMARY KEY,
    cliente_id integer REFERENCES public.clientes(id),
    producto text,
    cantidad integer
)
/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.*/
INSERT INTO public.pedidos (id, cliente_id, producto, cantidad)
	VALUES (1, 2, 'Camiseta', 2);
/*7. Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE public.pedidos
SET cantidad =3
WHERE ID=1
/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM public.pedidos
WHERE iD=1
/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE IF NOT EXISTS public.productos(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    precio decimal(10,2))
/*10. Insertar varios productos en la tabla "Productos" con diferentes valores*/
INSERT INTO public.productos ( producto, precio)
VALUES ('Camiseta', 25);
/*11. Consultar todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.clientes
/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.*/
SELECT * FROM public.pedidos
/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/
SELECT * FROM public.producto
WHERE precio > 50
/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.*/
SELECT * FROM public.pedidos
WHERE cantidad =5
/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A".*/
SELECT * FROM public.clientes
WHERE name LIKE 'A%'
/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.*/
SELECT name as "nombre cliente", cantidad as "total pedidos"
FROM public.clientes
LEFT JOIN public.pedidos
ON clientes.id = pedidos.cliente_id;
/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.*/
SELECT name as "producto", cantidad as "cantidad pedidos"
FROM public.producto
LEFT JOIN public.pedidos
ON producto.id = pedidos.producto_id;
/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
ALTER TABLE public.pedidos
ADD fecha DATE;
/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".*/
ALTER TABLE public.Pedidos
ADD CONSTRAINT fk_producto
FOREIGN KEY (producto)
REFERENCES productos (name)
/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.*/
SELECT C.nombre AS "Nombre del Cliente", P.nombre AS "Nombre del Producto", Pd.cantidad AS "Cantidad del Pedido"
FROM Clientes AS C
INNER JOIN Pedidos AS Pd ON C.id = Pd.cliente_id
INNER JOIN Productos AS P ON P.nombre = Pd.producto;