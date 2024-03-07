/*
IFNULL

es una función en SQL que se utiliza para manejar valores NULL.
Proporciona una forma de controlar y reemplazar valores NULL por un valor alternativo especificado.
*/

-- Obtiene el nombre, apellido y edad de la tabla "users", y si la edad es nula la muestra como 0
SELECT nombres, apellidos, IFNULL(edad, 0) as edades FROM users;