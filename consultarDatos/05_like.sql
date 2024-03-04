/*
LIKE
es un operador en SQL que se utiliza junto con la cláusula WHERE para buscar patrones en valores de texto.
Este operador es útil cuando deseas buscar valores que coincidan con un cierto patrón de caracteres en una columna de texto.
*/

-- Obtiene todos datos de la tabla "users" que contienen un email con el texto "gmail.com" en su parte final
SELECT * FROM users WHERE correo LIKE '%gmail.com';

-- Obtiene todos datos de la tabla "users" que contienen un email con el texto "riwi" en su parte inicial
SELECT * FROM users WHERE correo LIKE 'riwi%';

-- Obtiene todos datos de la tabla "users" que contiene "sh" en su correo
SELECT * FROM users WHERE correo LIKE '%sh%';

-- Obtiene todos datos de la tabla "users" donde el nombre que tengan una "a" en su segunda letra
SELECT * FROM users WHERE nombres LIKE '_a%';