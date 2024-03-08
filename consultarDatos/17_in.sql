/*
IN

Es un operador lógico en SQL que se utiliza para comparar un valor de columna con una lista de valores especificada.
Es una forma eficiente de filtrar filas en una tabla basada en la pertenencia a un conjunto de valores predefinido.
*/

-- Ordena todos los datos de la tabla "users" que les guste la musica merengue, rock y metal
SELECT * FROM users WHERE musica IN ('merengue', 'rock', 'metal')

-- Ordena todos los datos de la tabla "users" que les guste la musica merengue, rock y metal pero mediante OR
SELECT * FROM users WHERE musica = "merengue" or musica = "rock" or musica = "metal"

-- En este caso, ambos comandos son equivalentes. Sin embargo, si tuviéramos que comparar con más columnas, IN sería más eficiente.