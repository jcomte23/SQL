/*
WHERE
Es una cláusula en SQL que se utiliza para filtrar filas de una tabla según un criterio específico.
Permite especificar una condición que debe cumplir cada fila para ser incluida en los resultados de
la consulta
*/

-- Filtra todos los datos de la tabla "users" con edad igual a 15
SELECT * FROM users WHERE edad = 15;

-- Filtra todos los nombres de la tabla "users" con edad igual a 15
SELECT nombres FROM users WHERE edad = 15;

-- Filtra todos los nombres distintos de la tabla "users" con edad igual o mayor a 18
SELECT DISTINCT nombres FROM users WHERE edad >= 18;
