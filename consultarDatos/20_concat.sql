/*
CONCAT

Es una función de cadena en SQL que se utiliza para unir (concatenar) dos o más cadenas de texto en una sola cadena.
*/

-- Concatena en una sola columa los campos nombre y apellido
SELECT CONCAT( nombres, ' ',  apellidos) as "nombres completos" FROM users

-- Tambien podemos usar el concat para entrar informacion mas descriptiva
SELECT CONCAT( nombres, ' ',  apellidos, ' tiene el correo ', correo) as "Correos" FROM users

