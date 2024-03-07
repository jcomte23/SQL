/*
NULL

En SQL, NULL se utiliza para representar valores desconocidos o indefinidos en una base de datos.
NULL no es lo mismo que un valor cero, una cadena vacía o un espacio en blanco.
Indica la ausencia de un valor conocido o la falta de datos en una columna.
*/

-- Obtiene todos datos de la tabla "users" de la tabla "users" con email nulo
SELECT * FROM users WHERE correo IS NULL;

-- Obtiene todos datos de la tabla "users" de la tabla "users" con email no nulo
SELECT * FROM users WHERE correo IS NOT NULL;

-- Obtiene todos datos de la tabla "users" de la tabla "users" con email no nulo y edad igual a 15
SELECT * FROM users WHERE correo IS NOT NULL AND age = 15;

