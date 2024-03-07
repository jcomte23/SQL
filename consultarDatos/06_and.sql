/*
AND

El operador AND se utiliza en SQL para combinar múltiples condiciones en una cláusula WHERE.
Cuando utilizas AND, ambas condiciones deben ser verdaderas para que se seleccione una fila en el conjunto de resultados
*/

-- Obtiene todos datos de la tabla "users" donde sean de genero masculino y que vivan en colombia
SELECT * FROM users WHERE genero = 'M' AND pais = 'colombia';

-- Obtiene todos datos de la tabla "users" con nombre que comienze con 'a' y apellido con 'b'
SELECT * FROM users WHERE nombres LIKE 'a%' AND apellidos LIKE 'b%';

-- Obtiene todos datos de la tabla "users" que comienzen con la letra 'a'
SELECT * FROM users WHERE nombres LIKE 'a%' AND apellidos LIKE 'a%' AND correo LIKE 'a%';