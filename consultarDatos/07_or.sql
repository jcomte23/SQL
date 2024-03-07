/*
OR
El operador OR se utiliza en SQL para combinar múltiples condiciones en una cláusula WHERE, 
permitiendo que al menos una de las condiciones sea verdadera para que se seleccione una fila en el conjunto de resultados
*/

-- Obtiene todos datos de la tabla "users" que vivan en colombia,ecuador o venezuela
SELECT * FROM users WHERE pais = 'colombia' OR pais = 'ecuador' OR pais = 'venezuela'

-- Obtiene todos datos de la tabla "users" que escuchen reggaeton o que sean menores de edad
SELECT * FROM users WHERE edad < 18 OR musica = 'reggaeton'