# Tipos de Datos en SQL

## Tipos de Datos Numéricos (Enteros)

Los tipos de datos enteros se utilizan para almacenar números enteros (sin decimales). A continuación se presenta la tabla con los tipos de enteros:

| Tipo              |  Tamaño |      Rango Signed |
| ----------------- | ------: | ----------------: |
| `TINYINT`         |  1 byte |        -128 → 127 |
| `SMALLINT`        | 2 bytes |  -32,768 → 32,767 |
| `MEDIUMINT`       | 3 bytes | -8,388,608 → 8,388,607 |
| `INT` / `INTEGER` | 4 bytes | -2,147,483,648 → 2,147,483,647 |
| `BIGINT`          | 8 bytes | -2^63 → 2^63 - 1  |

> **Nota:** En bases de datos como MySQL, estos tipos de datos también pueden tener el atributo `UNSIGNED`, lo que significa que no permiten valores negativos, duplicando así su límite máximo positivo (por ejemplo, `TINYINT UNSIGNED` va de 0 a 255). Además, `BOOLEAN` o `BOOL` en MySQL es un sinónimo de `TINYINT(1)`.

## Tipos de Datos Numéricos (Decimales)

Estos tipos se utilizan para almacenar valores numéricos que contienen fracciones decimales. La principal diferencia radica en cómo procesan la exactitud y el redondeo.

| Tipo           | Precisión   | Tamaño   | Uso típico           |
| -------------- | ----------- | -------- | -------------------- |
| `FLOAT`        | aproximada  | 4 bytes  | sensores, gráficos   |
| `DOUBLE`       | más precisa | 8 bytes  | cálculos científicos |
| `DECIMAL(p,s)` | exacta      | variable | dinero, finanzas     |

> **Nota:** **¡Regla de oro!** Nunca utilices `FLOAT` o `DOUBLE` para guardar dinero o información financiera. Como son tipos de "punto flotante", manejan aproximaciones y pueden generar pequeños errores de precisión en sumas (ej: `1.1 + 2.2 = 3.3000000000000003`). Para temas de dinero y cálculos donde necesitas precisión absoluta, usa **siempre `DECIMAL(p,s)`**, donde `p` es el total de dígitos (precisión) y `s` es cuántos de esos son decimales (escala).

## Tipos de Datos de Cadena (Texto)

Los tipos de datos de texto (o cadenas de caracteres) se utilizan para almacenar palabras, frases o bloques enteros de texto. Se dividen principalmente en tamaños fijos y variables.

| Tipo         |  Tamaño máximo | Uso típico          |
| ------------ | -------------: | ------------------- |
| `CHAR`       | 255 caracteres | texto fijo          |
| `VARCHAR`    |    65 KB aprox | texto variable      |
| `TINYTEXT`   |      255 bytes | textos muy pequeños |
| `TEXT`       |          65 KB | textos normales     |
| `MEDIUMTEXT` |          16 MB | textos largos       |
| `LONGTEXT`   |           4 GB | textos gigantes     |

> **Nota:** La principal diferencia entre `CHAR` y `VARCHAR` es que `CHAR` siempre ocupa el tamaño especificado (rellenando con espacios si es necesario), mientras que `VARCHAR` solo ocupa el espacio del texto ingresado más la longitud del texto. Se recomienda usar `CHAR` para datos que siempre tienen la misma longitud (como códigos postales o hashes) y `VARCHAR` para todo lo demás.

## Tipos de Datos de Fecha y Hora

Los tipos de datos de fecha y hora permiten almacenar instantes temporales de forma estandarizada, facilitando cálculos y búsquedas por rangos.

| Tipo        | Guarda                | Formato               | Uso típico               |
| ----------- | --------------------- | --------------------- | ------------------------ |
| `DATE`      | solo fecha            | `YYYY-MM-DD`          | cumpleaños, vencimientos |
| `TIME`      | solo hora             | `HH:MM:SS`            | duración, horarios       |
| `DATETIME`  | fecha + hora          | `YYYY-MM-DD HH:MM:SS` | eventos, registros       |
| `TIMESTAMP` | fecha + hora especial | `YYYY-MM-DD HH:MM:SS` | auditoría, `created_at`  |
| `YEAR`      | solo año              | `YYYY`                | años específicos         |

> **Nota:** La diferencia clave entre `DATETIME` y `TIMESTAMP` (especialmente en MySQL) es la zona horaria. `TIMESTAMP` convierte el valor insertado a UTC para almacenarlo y luego a la zona horaria local cuando se consulta. Es ideal para aplicaciones globales y campos de auditoría como `created_at`. `DATETIME` simplemente almacena la fecha y hora tal como se la pasas, sin conversiones de zona horaria.

## Tipos de Datos Lógicos (Booleanos)

Los tipos de datos booleanos se utilizan para representar estados lógicos binarios, es decir, situaciones donde solo existen dos posibilidades (sí/no, verdadero/falso).

| Tipo      | Internamente | Valores          | Uso típico       |
| --------- | ------------ | ---------------- | ---------------- |
| `BOOLEAN` | `TINYINT(1)` | `TRUE` / `FALSE` | activo/inactivo  |
| `BOOL`    | `TINYINT(1)` | `1` / `0`        | alias de BOOLEAN |

> **Nota:** En bases de datos como MySQL, los tipos `BOOLEAN` o `BOOL` no son un tipo de dato nativo separado. El motor los traduce internamente como `TINYINT(1)`. Convencionalmente, el valor `0` es evaluado como `FALSE` (falso) y el valor `1` como `TRUE` (verdadero).

## Tipos de Datos de Conjunto y Enumeración

Estos tipos de datos son ideales cuando tienes una columna que solo puede contener ciertos valores predefinidos muy específicos.

| Tipo      | Guarda                      | Tamaño        | Uso típico                   |
| --------- | --------------------------- | ------------- | ---------------------------- |
| `ENUM`    | 1 valor de una lista        | 1 o 2 bytes   | estado civil, tallas de ropa |
| `SET`     | 0 o más valores de una lista| 1 a 8 bytes   | etiquetas, permisos (roles)  |

> **Nota:** `ENUM` es excelente para forzar reglas a nivel de base de datos. Por ejemplo, una columna definida como `talla ENUM('S', 'M', 'L')` no permitirá que nadie inserte `'XL'`. Sin embargo, una advertencia: si tu lista de opciones va a cambiar frecuentemente en el futuro, suele ser mejor crear una tabla separada en lugar de usar `ENUM`.

## Tipos de Datos Binarios (BLOB)

Los tipos BLOB (*Binary Large Object*) se utilizan para almacenar datos binarios en bruto. Es común encontrárselos en sistemas antiguos o "legacy".

| Tipo         | Tamaño máximo | Guarda          | Uso típico     |
| ------------ | ------------- | --------------- | -------------- |
| `TINYBLOB`   | 255 bytes     | binario pequeño | iconos         |
| `BLOB`       | 65 KB         | datos binarios  | imágenes, PDFs |
| `MEDIUMBLOB` | 16 MB         | binario mediano | documentos     |
| `LONGBLOB`   | 4 GB          | binario enorme  | videos grandes |

> **Nota:** **¿Cuándo usarlo y cuándo no?** Aunque la base de datos permite guardar archivos como imágenes o videos usando `BLOB`, en el desarrollo de software moderno esto se considera una **mala práctica**. Hacerlo hace que la base de datos crezca desproporcionadamente, ralentiza las consultas y hace que los respaldos (backups) sean enormes.
> **La mejor práctica** actual es guardar los archivos en un servidor de almacenamiento externo (como la carpeta de un servidor, Amazon S3, etc.) y en la base de datos usar un simple `VARCHAR` para guardar **la ruta o la URL** de donde vive ese archivo.

## Tipos de Datos Estructurados (JSON)

En las bases de datos modernas (como MySQL 5.7+ o PostgreSQL), es posible almacenar documentos JSON de manera nativa. Esto te brinda la flexibilidad de una base de datos NoSQL (como MongoDB) dentro de tu base de datos SQL.

| Tipo   | Guarda                     | Uso típico                              |
| ------ | -------------------------- | --------------------------------------- |
| `JSON` | Objetos y arreglos en JSON | configuraciones, datos sin esquema fijo |

> **Nota:** La ventaja gigante de usar la columna `JSON` frente a guardar el texto en un `LONGTEXT`, es que la base de datos valida que el formato sea correcto. Pero lo más importante: **te permite hacer consultas SQL para buscar o modificar datos por dentro del objeto**. Por ejemplo, puedes hacer una consulta para buscar únicamente los registros donde la propiedad `tema` dentro de la columna JSON sea igual a `"oscuro"`.

## Tipos Geográficos y Espaciales (GIS)

Utilizados para almacenar información de geolocalización, cartografía y geometría en aplicaciones que requieren cálculos sobre mapas o terrenos.

| Tipo         | Guarda              | Uso típico |
| ------------ | ------------------- | ---------- |
| `POINT`      | coordenada (X, Y)   | GPS, ubicaciones |
| `LINESTRING` | ruta o línea        | caminos, trayectos |
| `POLYGON`    | área cerrada        | zonas, delimitaciones territoriales |
| `GEOMETRY`   | cualquier geometría | genérico   |

> **Nota:** ¿Por qué usar estos tipos en lugar de guardar la latitud y longitud en dos columnas numéricas separadas? Porque las bases de datos incluyen funciones matemáticas espaciales optimizadas. Puedes hacer consultas complejas y súper eficientes como: *"Encuentra todos los restaurantes (POINT) que estén dentro de este barrio (POLYGON)"* o *"Calcula la distancia exacta entre dos ciudades"*.
