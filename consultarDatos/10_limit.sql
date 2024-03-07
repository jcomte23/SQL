/*
LIMIT

La cláusula LIMIT se utiliza en SQL para restringir el número de filas devueltas por una consulta.
Esto es útil cuando se trabaja con grandes conjuntos de datos y solo se necesitan un número específico de resultados
*/

-- Obtiene las 3 primeras filas de la tabla "users"
SELECT * FROM users LIMIT 3;

-- Obtiene las 10 primeras filas de la tabla "users" con pais distinto a colombia o edad igual a 15
SELECT * FROM users WHERE NOT (pais = 'colombia' OR edad = 15) LIMIT 10;