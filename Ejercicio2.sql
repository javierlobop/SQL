/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero)*/
CREATE TABLE IF NOT EXISTS public.usuarios(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT)

/*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO public.usuarios (name,age) 
VALUES ('Fernando', 42);
INSERT INTO public.usuarios (name,age) 
VALUES ('Alonso',33);

/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE public.usuarios
SET age = 34
WHERE id = 2
/*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM public.usuarios
WHERE id = 2;
Moderado
/*1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto)*/
CREATE TABLE IF NOT EXISTS public.ciudades (
	id SERIAL PRIMARY KEY,
	name VARCHAR (255) NOT NULL,
	country TEXT NOT NULL
)
/*2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO public.ciudades (name, country) VALUES ('Madrid','España');
INSERT INTO public.ciudades (name, country) VALUES ('Londres','UK');
INSERT INTO public.ciudades (name, country) VALUES ('Visby','Suecia');
/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades"*/
ALTER TABLE public.usuarios
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id)
REFERENCES Ciudades (id)

/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT U.name AS "Nombre del Usuario", C.name AS "Nombre de la Ciudad", C.country AS "Nombre del País"
FROM Usuarios AS U
LEFT JOIN Ciudades AS C ON U.ciudad_id = C.id;
/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN)*/
SELECT U.name AS "Nombre del Usuario", C.name AS "Nombre de la Ciudad", C.country AS "Nombre del País"
FROM Usuarios AS U
INNER JOIN Ciudades AS C ON U.ciudad_id = C.id;