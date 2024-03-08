/*
BETWEEN

Es un operador en SQL que se utiliza para seleccionar valores dentro de un rango específico. Es útil para filtrar datos basados en valores mínimos y máximos
*/

-- Ordena todos los datos de la tabla "users" con edad comprendida entre 20 y 30
SELECT * FROM users WHERE edad BETWEEN 20 AND 30