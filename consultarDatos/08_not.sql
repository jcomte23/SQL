/*
NOT

El operador NOT se utiliza en SQL para negar una condición en una cláusula WHERE,
es decir, seleccionar las filas que no cumplan con la condición especificada.
*/

-- Obtiene todos datos de la tabla "users" que NO vivan en colombia,ecuador o venezuela
SELECT * FROM users WHERE NOT (pais = 'colombia' OR pais = 'ecuador' OR pais = 'venezuela');

-- Obtiene todos datos de la tabla "users" que escuchen reggaeton o que sean menores de edad
SELECT * FROM users WHERE NOT (pais = 'canada' OR musica = 'vallenato')