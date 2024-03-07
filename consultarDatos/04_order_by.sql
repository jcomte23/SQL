/*
ORDER BY

es una cláusula en SQL que se utiliza para ordenar el conjunto de resultados de una consulta según una o más columnas.
Puedes especificar el orden en el que deseas ordenar las filas, ya sea ascendente (ASC) o descendente (DESC).
*/

-- Ordena todos los datos de la tabla "users" por edad (ascendente por defecto)
SELECT * FROM users ORDER BY edad;

-- Ordena todos los datos de la tabla "users" por edad de manera ascendente
SELECT * FROM users ORDER BY edad ASC;

-- Ordena todos los datos de la tabla "users" por edad de manera descendente
SELECT * FROM users ORDER BY edad DESC;

-- Obtiene todos los datos de la tabla "users" mayores de edad y los ordena por edad de manera descendente
SELECT * FROM users WHERE edad >= 18 ORDER BY edad DESC;

-- Obtiene todos los nombres de la tabla "users" mayores de edad y los ordena por edad de manera descendente
SELECT nombres FROM users WHERE edad >= 18 ORDER BY edad DESC;

-- Obtiene todos los nombres y paises de "users" pero los ordena por nombres y despues por paises
SELECT nombres,pais FROM users order by nombres DESC ,pais ASC;