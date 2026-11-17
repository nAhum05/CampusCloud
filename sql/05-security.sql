use master

-- Crear un login
CREATE LOGIN consulta_campus
WITH PASSWORD = '<CAMBIAR_PASSWORD>'

-- selecccionamos CampusCloud y creamos el usuario Asociado

use CampusCloud

CREATE USER consulta_campus
FOR LOGIN consulta_campus;


-- CREAR ROL rol_consulta

CREATE ROLE rol_consulta;

-- Permisos de Lectura

GRANT SELECT TO rol_consulta;

-- Agregamos el usuario al rol

ALTER ROLE rol_consulta
ADD MEMBER consulta_campus;

--LOGIN

use master;

CREATE LOGIN operador_campus
WITH PASSWORD = '<CAMBIAR_PASSWORD>';


use CampusCloud;

CREATE USER operador_campus
FOR LOGIN operador_campus;

CREATE ROLE rol_operador;

GRANT SELECT, INSERT, UPDATE
TO rol_operador;

ALTER ROLE rol_operador
ADD MEMBER operador_campus;

use master

CREATE LOGIN admin_campus
WITH PASSWORD = '<CAMBIAR_PASSWORD>';

USE CampusCloud;

CREATE USER admin_campus
FOR LOGIN admin_campus

ALTER ROLE db_owner
ADD MEMBER admin_campus;

