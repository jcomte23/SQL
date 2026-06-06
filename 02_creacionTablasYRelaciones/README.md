# Creación de Tablas y Relaciones

En las bases de datos relacionales, el verdadero poder no está en guardar datos en tablas aisladas, sino en cómo conectamos esas tablas entre sí. Para esto utilizamos dos conceptos fundamentales: **Llave Primaria (Primary Key)** y **Llave Foránea (Foreign Key)**.

## ¿Qué son las Llaves?

### 1. Llave Primaria (Primary Key - PK)
Es el "documento de identidad" de un registro. Es una columna (o conjunto de columnas) que identifica de manera **única e irrepetible** a cada fila de la tabla. 
* **Reglas:** No puede contener valores duplicados y no puede estar vacía (`NULL`).
* **Ejemplo:** El número de cédula de una persona o, más comúnmente, un número autoincrementable (`id`).

### 2. Llave Foránea (Foreign Key - FK)
Es el "puente" que conecta una tabla con otra. Es una columna en una tabla que hace referencia a la Llave Primaria de otra tabla.
* **Propósito:** Garantizar la **integridad referencial**. Es decir, asegura que no puedas asignar, por ejemplo, un comentario a una publicación que no existe.

---

## Ejemplo Práctico: Relación de "Uno a Muchos" (1:N)

Imagina un blog o una red social. Tienes **publicaciones** (posts) y **comentarios**.
La regla de negocio dice: *"Una publicación puede tener muchos comentarios, pero un comentario pertenece a una sola publicación"*. Esto es una relación **1:N**.

Para lograr esto, veamos cómo se crearían ambas tablas:

```sql
-- 1. Primero creamos la tabla "padre" (la que no depende de nadie)
CREATE TABLE publicaciones(
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    contenido TEXT
);

-- 2. Luego creamos la tabla "hija" (la que depende de la publicación)
CREATE TABLE comentarios(
    id TINYINT PRIMARY KEY AUTO_INCREMENT,  -- Esta es la Llave Primaria del comentario
    publicacion_id TINYINT,                 -- Esta será nuestra Llave Foránea
    usuario_id TINYINT NULL,
    fecha_comentario DATETIME,
    
    -- Aquí declaramos formalmente la relación:
    FOREIGN KEY (publicacion_id) 
        REFERENCES publicaciones(id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
```

### Entendiendo la declaración de la Llave Foránea:

La sintaxis `FOREIGN KEY (publicacion_id) REFERENCES publicaciones(id)` le dice a la base de datos: 
*"Oye, el valor que pongan en la columna `publicacion_id` de los comentarios, **tiene que existir obligatoriamente** en la columna `id` de la tabla `publicaciones`"*.

---

## El comportamiento: ON DELETE y ON UPDATE

¿Qué pasa si tienes una publicación con 10 comentarios y decides borrar la publicación? Aquí es donde entra la magia de las reglas de acción.

### `ON DELETE CASCADE` (Borrado en Cascada)
Si eliminas la publicación (el padre), la base de datos **automáticamente eliminará todos los comentarios** asociados a ella. 
Es extremadamente útil para no dejar "datos huérfanos" (comentarios fantasmas de un post que ya no existe).

### `ON UPDATE CASCADE` (Actualización en Cascada)
Si por alguna razón cambiaras el `id` de una publicación (ej. de `id = 1` a `id = 99`), la base de datos irá automáticamente a la tabla de comentarios y cambiará todos los `publicacion_id` de `1` a `99`. 

> **Otras opciones populares:**
> * `RESTRICT` (o no poner nada, que es el valor por defecto): La base de datos te lanzará un error y **no te dejará** borrar la publicación si esta tiene comentarios. Te obliga a borrar los comentarios primero manualmente.
> * `SET NULL`: Si borras la publicación, no se borran los comentarios, pero su columna `publicacion_id` pasará a valer `NULL` (quedan huérfanos pero no se eliminan).
