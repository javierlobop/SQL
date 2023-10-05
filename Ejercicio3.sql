/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE IF NOT EXISTS public.productos(
	id_producto SERIAL PRIMARY KEY,
	nombre_producto VARCHAR (255) NOT NULL,
	precio_producto DECIMAL 
)
/*2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO public.productos (nombre_producto,precio_producto) VALUES ('jamón',12.30);
INSERT INTO public.productos (nombre_producto,precio_producto) VALUES ('leche',0.8);
INSERT INTO public.productos (nombre_producto,precio_producto) VALUES ('pan',0.7);
INSERT INTO public.productos (nombre_producto,precio_producto) VALUES ('pollo',6.2);
INSERT INTO public.productos (nombre_producto,precio_producto) VALUES ('aguacate',1.75);
/*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE public.productos
SET precio_producto =0.9
WHERE id_producto= 3

/*4. Elimina un producto de la tabla "Productos".*/
DELETE FROM public.productos
WHERE id_producto = 5

/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos").*/
CREATE TABLE IF NOT EXISTS public.Pedidos (
    id serial PRIMARY KEY,
    usuario_id integer NOT NULL,
    producto_id integer NOT NULL,
	CONSTRAINT FK_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios (id))
ALTER TABLE public.pedidos
ADD CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES productos (id_producto)
INSERT INTO public.pedidos (usuario_id, producto_id) VALUES (1,2);
INSERT INTO public.pedidos (usuario_id, producto_id) VALUES (2,4);
SELECT U.name AS "Nombre del Usuario", P.nombre_producto AS "Nombre del Producto"
FROM Usuarios AS U
INNER JOIN Pedidos AS Pe ON U.id = Pe.usuario_id
INNER JOIN Productos AS P ON Pe.producto_id = P.id_producto;
