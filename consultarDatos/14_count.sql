/*
COUNT
Rs una función de agregación en SQL que se utiliza para contar el número de filas en una tabla o en un conjunto de filas que cumplen con una condición específica.
*/

-- Cuenta cuantas filas contiene la tabla "users"
Select COUNT(*) FROM users;

-- Cuenta cuantas filas contienen un dato no nulo en el campo edad de la tabla "users"
Select COUNT(edad) FROM users;