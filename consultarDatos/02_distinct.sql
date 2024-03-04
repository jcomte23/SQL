/*
DISTINCT
es una cláusula en SQL que se utiliza junto con la cláusula SELECT para eliminar duplicados
de los resultados de una consulta. Cuando se utiliza DISTINCT, el motor de la base de datos
eliminará las filas duplicadas de los resultados devueltos por la consulta.
*/

-- Obtiene todos los datos distintos entre sí de la tabla "users"
SELECT DISTINCT * FROM users;

-- Obtiene todos los valores distintos referentes al atributo musica de la tabla "users"
SELECT DISTINCT musica FROM users;