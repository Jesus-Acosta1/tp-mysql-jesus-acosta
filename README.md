# tp-mysql-jesus-acosta

# 📘 Trabajo Practico SQL – Sistema de Gestión Veterinaria

## 📌 Descripción del proyecto

Este proyecto consiste en el diseño y desarrollo de una **base de datos relacional** para un sistema de gestión veterinaria. El objetivo es administrar de forma ordenada la información de **mascotas, dueños, veterinarios y el historial clínico**, aplicando correctamente los conceptos fundamentales de bases de datos.

El trabajo fue realizado poniendo en práctica el uso de:

- Claves primarias y foráneas
- Relaciones entre tablas
- JOINs múltiples
- Consultas SQL
- Integridad referencial

---

## 🗂️ Estructura de la base de datos

La base de datos está compuesta por las siguientes tablas principales:

### 🐾 mascotas

- `id` (PK)
- `nombre`
- `especie`
- `dueno_id` (FK)

### 👤 duenos

- `id` (PK)
- `nombre`
- `apellido`

### 👨‍⚕️ veterinarios

- `id` (PK)
- `nombre`
- `apellido`

### 📋 historial_clinico

- `id` (PK)
- `mascota_id` (FK)
- `veterinario_id` (FK)
- `fecha_registro`
- `descripcion`

---

## 🔗 Relaciones entre tablas

- Una **mascota** pertenece a un **dueño**.
- Una **mascota** puede tener múltiples registros en el **historial clínico**.
- Cada entrada del **historial clínico** es realizada por un **veterinario**.

Las relaciones se implementan mediante **claves foráneas**, asegurando la integridad de los datos.

---

## 🛠️ Tecnologías utilizadas

- **MySQL**
- **SQL** (DDL y DML)
- Entorno de gestión: MySQL Workbench / phpMyAdmin

---

## ✅ Objetivos cumplidos

- ✔ Diseño correcto de tablas
- ✔ Uso adecuado de claves primarias y foráneas
- ✔ Implementación de JOINs simples y múltiples
- ✔ Consultas ordenadas y legibles
- ✔ Base de datos normalizada

---

## 📌 Conclusión

Este proyecto permitió afianzar los conceptos fundamentales de bases de datos relacionales y comprender la importancia de un buen diseño para garantizar consistencia, escalabilidad y facilidad de consulta de la información.

---
