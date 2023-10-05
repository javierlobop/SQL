/*Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE IF NOT EXISTS public.Pedidos (
    id serial PRIMARY KEY,
    usuario_id integer NOT NULL,
    producto_id integer NOT NULL,
	CONSTRAINT FK_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
  CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES productos (id_producto))
/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos.*/
INSERT INTO public.pedidos (usuario_id, producto_id) VALUES (1,2);
INSERT INTO public.pedidos (usuario_id, producto_id) VALUES (2,4);
INSERT INTO public.pedidos (usuario_id, producto_id) VALUES (2,1);
/*3Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE)*/
SELECT U.name AS "Nombre del Usuario", COALESCE(P.nombre_producto, 'Ningún pedido realizado') AS "Nombre del Producto"
FROM public .usuarios U
LEFT JOIN public.pedidos Pe ON U.id = Pe.usuario_id;
LEFT JOIN public.productos P ON Pe.producto_id = P.id_producto;
/*4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN).*/
SELECT u.name AS "Nombre del Usuario",
FROM public.usuarios u
LEFT JOIN public.pedidos pe ON u.id = pe.usuario_id
/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE public.pedidos pe 
ADD COLUMN cantidad INT;
UPDATE pe  SET cantidad=1 WHERE id = 1;
UPDATE pe  SET cantidad=7 WHERE id = 2;
UPDATE pe  SET cantidad=4 WHERE id = 3;