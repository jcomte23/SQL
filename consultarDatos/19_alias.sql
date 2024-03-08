/*
ALIAS

Un alias en SQL es un nombre temporal que se le asigna a una columna, tabla o vista para facilitar la referencia y mejorar la legibilidad del código.
*/

-- Se le cambian el nombre a las columnas por unos mas adecuados en caso de ser necesario
SELECT nombres as Nombres, created_at AS 'Fecha del registro', updated_at AS 'Fecha de ultima actualizacion' FROM users 