/*
AND, OR y NOT

El operador NOT se utiliza en SQL para negar una condición en una cláusula WHERE,
es decir, seleccionar las filas que no cumplan con la condición especificada.
*/

-- Obtiene todos datos de la tabla "users" con email distinto a los que finalizen en ...@gmail.com
SELECT * FROM users WHERE NOT correo LIKE '%@gmail.com';

-- Obtiene todos datos de la tabla "users" con email distinto a los que finalizen en ...@gmail.com y edad igual a 15
SELECT * FROM users WHERE NOT correo LIKE '%@gmail.com' AND edad = 15;

-- Obtiene todos datos de la tabla "users" con email distinto a los que finalizen en ...@gmail.com o edad igual a 15
SELECT * FROM users WHERE NOT correo LIKE '%@gmail.com' OR edad = 15;