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

## El comportamiento ante Cambios: ON DELETE y ON UPDATE

¿Qué pasa si tienes una publicación con 10 comentarios y decides eliminarla o cambiarle su `id`? Aquí es donde entran las reglas de acción o de integridad referencial. Puedes configurarlas de las siguientes maneras:

### 1. `CASCADE` (En Cascada)
Es la acción automática que se propaga a los hijos.
* **`ON DELETE CASCADE`**: Si eliminas la publicación (el padre), la base de datos **automáticamente eliminará** todos sus comentarios (los hijos). Es ideal para no dejar "datos basura" u huérfanos.
* **`ON UPDATE CASCADE`**: Si cambias el `id` de la publicación (ej. de `1` a `99`), la base de datos actualizará todos los `publicacion_id` de los comentarios a `99`.

### 2. `RESTRICT` (Restringir)
Es una barrera de seguridad estricta para evitar accidentes.
* Si intentas borrar o actualizar una publicación que ya tiene comentarios, la base de datos **detendrá la operación inmediatamente y te lanzará un error**.
* Te obliga a ir tú mismo, borrar primero los comentarios manualmente, y solo entonces te permitirá borrar la publicación padre.

### 3. `NO ACTION` (Sin Acción)
En MySQL, se comporta en la práctica de manera **idéntica a `RESTRICT`**.
* Detiene el borrado o la actualización si existen registros dependientes. La diferencia técnica (en SQL estándar) es que `NO ACTION` permite revisar las reglas al final de una transacción, pero MySQL lo procesa igual que `RESTRICT`.
* **Dato importante:** Si no escribes nada en la creación de tu llave foránea, este es el comportamiento por defecto de la base de datos.

### 4. `SET NULL` (Asignar Nulo)
Es la opción para dejar "huérfanos reconocidos".
* **`ON DELETE SET NULL`**: Si borras la publicación, los comentarios **no se eliminan**. En cambio, el valor de su columna `publicacion_id` pasará a ser `NULL`.
* **Caso de uso estrella:** Imagina una tabla `empleados` y `computadoras`. Si borras a un empleado, no vas a destruir la computadora; simplemente el campo `empleado_id` de esa compu queda en `NULL` indicando que está libre para asignarse a otro.
* *(Nota: Para que esto funcione, la columna de la llave foránea debe permitir explícitamente valores nulos).*
