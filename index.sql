-- Ejercicio 1 – Crear Base de Datos
-- Crear una base de datos llamada veterinaria_patitas_felices.

CREATE DATABASE veterinaria_patitas_felices;

USE  veterinaria_patitas_felices;

-- Ejercicio 2 – Crear tabla duenos
-- Crear la tabla duenos con las siguientes columnas:


CREATE TABLE duenos (
	id INT PRIMARY KEY AUTO_INCREMENT
	,nombre VARCHAR(50) NOT NULL
	,apellido VARCHAR(50) NOT NULL
	,telefono VARCHAR(20) NOT NULL
	,direccion VARCHAR(100)
	);



-- Ejercicio 3 – Crear tabla mascotas
-- Crear la tabla mascotas con las siguientes columnas:

CREATE TABLE mascotas (
	id INT PRIMARY KEY AUTO_INCREMENT
	,nombre VARCHAR(50) NOT NULL
	,especie VARCHAR(30) NOT NULL
	,fecha_nacimiento DATE
	,id_dueno INT
	,FOREIGN KEY (id_dueno) REFERENCES duenos(id)
	);


-- Ejercicio 4 – Crear tabla veterinarios
-- Crear la tabla veterinarios con las siguientes columnas:


CREATE TABLE veterinarios (
	id INT PRIMARY KEY AUTO_INCREMENT
	,nombre VARCHAR(50) NOT NULL
	,apellido VARCHAR(50) NOT NULL
	,matricula VARCHAR(20) NOT NULL UNIQUE
	,especialidad VARCHAR(50) NOT NULL
	);


-- Ejercicio 5 – Crear tabla historial_clinico
-- Crear la tabla historial_clinico con las siguientes columnas:

CREATE TABLE historial_clinico (
	id INT PRIMARY KEY AUTO_INCREMENT
	,id_mascota INT
	,id_veterinario INT
	,fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
	,descripcion VARCHAR(250) NOT NULL
	,FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id)
	,FOREIGN KEY (id_mascota) REFERENCES mascotas(id) ON DELETE CASCADE
	);


-- Ejercicio 6 – Insertar registros
-- Insertar:
-- ● 3 dueños con información completa
-- ● 3 mascotas, cada una asociada a un dueño
-- ● 2 veterinarios con especialidades distintas
-- ● 3 registros de historial clínico

INSERT INTO duenos(nombre, apellido, telefono, direccion) VALUES
            ('Jesus', 'Acosta','555-9900','Av Rivadavia #12'),
            ('Diego', 'Gonzalez','555-3344','Av cordoba #30'),
            ('Carlos','Silva','555-7788','Av Carabobo #67');
            

INSERT INTO mascotas(nombre, especie, fecha_nacimiento, id_dueno) VALUES
            ('princesa','Perro','2020-02-05', 1),
            ('Abigail','Gato','2019-12-09',2),
            ('luke','Perro','2017-07-12',3);

INSERT INTO veterinarios(nombre, apellido, matricula, especialidad) VALUES
                    ('Jose','Rodriguez','AA123BB','Medicina Interna'),
                    ('matias','Lopez','BC345DF', 'Cirugía');
                    
INSERT INTO historial_clinico(id_mascota, id_veterinario, fecha_registro, descripcion) VALUES
                        (1,1,'2025-08-15','Tratamiento de Infecciones: Se diagnosticó una infección activa en el paciente, presentando síntomas compatibles con proceso bacteriano/viral. Se inició tratamiento con medicación específica según sensibilidad, acompañado de seguimiento periódico.'),

                        (2,2,'2025-10-19','Cirugía de Procedimiento de Tejidos Blandos: El paciente fue sometido a una cirugía para corregir la afección identificada. El procedimiento se realizó bajo anestesia general. No se presentaron complicaciones intraoperatorias.'),

                        (3,2,'2025-11-24','Cirugía de Extracción de Masa: Se llevó a cabo una intervención quirúrgica de extracción de una masa o corrección anatómica. El paciente toleró la cirugia y se estableció un plan de manejo postoperatorio y seguimiento para controlar la evolución.');

-- Ejercicio 7 – Actualizar registros
-- Realizar las siguientes actualizaciones:

-- 1. Cambiar la dirección de un dueño (por ID o nombre).
UPDATE duenos
SET direccion = 'Av Moreno #14'
WHERE id = 2;


-- 2. Actualizar la especialidad de un veterinario (por ID o matrícula).
UPDATE veterinarios
SET especialidad = 'Medicina Interna'
WHERE matricula = 'BC345DF';

-- 3. Editar la descripción de un historial clínico (por ID).
UPDATE historial_clinico
SET descripcion = 'Resolución Quirúrgica: Se realizó intervención quirúrgica bajo anestesia general para corregir la afección presentada. El paciente respondió bien al procedimiento y se indicó tratamiento postoperatorio y controles de seguimiento.'
WHERE id = 2;

-- Ejercicio 8 – Eliminar registros
-- 1. Eliminar una mascota (por ID o nombre).

DELETE FROM mascotas
WHERE id = 3 ;



-- 2. Verificar que se eliminen automáticamente los registros del historial clínico asociados
-- (ON DELETE CASCADE).


SELECT *
FROM historial_clinico
WHERE id = 3;

-- Ejercicio 9 – JOIN simple
-- Consulta que muestre:
-- ● Nombre de la mascota
-- ● Especie
-- ● Nombre completo del dueño (nombre + apellido)

-- OP 1
SELECT  mascotas.nombre, mascotas.especie, duenos.nombre, duenos.apellido
FROM mascotas
INNER JOIN duenos
ON mascotas.id = duenos.id;

-- OP 2 version resumida
SELECT  m.nombre, m.especie, d.nombre, d.apellido
FROM mascotas m
INNER JOIN duenos d
ON m.id = d.id;

-- Ejercicio 10 – JOIN múltiple con historial
-- Consulta que muestre todas las entradas del historial clínico con:
-- ● Nombre y especie de la mascota
-- ● Nombre completo del dueño
-- ● Nombre completo del veterinario
-- ● Fecha de registro
-- ● Descripción
-- Ordenados por fecha de registro descendente (DESC).


SELECT m.nombre, m.especie, d.nombre, d.apellido, v.nombre, v.apellido, h.fecha_registro, h.descripcion  
FROM historial_clinico h
INNER JOIN mascotas m ON h.id_mascota = m.id
INNER JOIN duenos d ON m.id_dueno = d.id 
INNER JOIN veterinarios v ON h.id_veterinario = v.id
ORDER BY h.fecha_registro DESC;
