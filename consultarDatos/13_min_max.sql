/*
MIN y MAX

Las funciones MIN() y MAX() son funciones de agregación en SQL que se utilizan para encontrar el valor mínimo y máximo,
respectivamente, de una columna en un conjunto de datos.
Estas funciones se utilizan comúnmente en combinación con la cláusula SELECT para realizar cálculos en conjunto de datos.
*/

-- Obtiene el valor menor del campo edad de la tabla "users"
Select MIN(edad) as "edad minima" FROM users;

-- Obtiene el valor mayor del campo edad de la tabla "users"
Select MAX(edad) as "edad maxima" FROM users;