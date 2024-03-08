/*
GROUP BY

es una cláusula en SQL que se utiliza para agrupar filas de una tabla en función de valores coincidentes en una o más columnas.
Luego, permite realizar cálculos agregados (SUM, COUNT, AVG, etc.) sobre esos grupos.
*/

-- Agrupa los resultados por edad diferente
SELECT MAX(edad) FROM users GROUP BY edad

-- Agrupa los resultados por edad diferente y cuenta cuantos registros existen de cada una
SELECT edad, COUNT(edad) as "cantidad de personas con esa edad"  FROM users GROUP BY edad

-- Agrupar a las personas pro el nombre del pais
SELECT pais, CONCAT(COUNT(*), " personas")  AS "poblacion" FROM users GROUP BY pais;
