-- 1. Gestion de roles fijos 

-- A. A nivel de servidor
use master

CREATE LOGIN admin_sql2
WITH PASSWORD = '<CAMBIAR_PASSWORD>';

-- AGREGAR UN INICO DE SESION (LOGIN) AL ROL DE ADMINISTRADOR DE SERVIDOR

ALTER SERVER ROLE sysadmin
ADD MEMBER admin_sql2

CREATE LOGIN admin_sql3
WITH PASSWORD = '<CAMBIAR_PASSWORD>';

-- AGREGAR AL ROL DE CREADOR DE BASE DE DATOS

ALTER SERVER ROLE dbcreator 
ADD MEMBER admin_sql3;



-- B  A nivel de base de datos

use CampusCloud;

CREATE USER admin_sql3
FOR LOGIN admin_sql3;

--use master

--CREATE LOGIN admin_sql2
--WITH PASSWORD = '<CAMBIAR_PASSWORD>';
-- Permitir sololectura ( Select en todas las tablas y todas las columnas)

ALTER ROLE db_datareader 
ADD MEMBER admin_sql3;

EXECUTE AS USER = 'admin_sql3'

SELECT * FROM Servicios

DELETE FROM Servicios WHERE id_servicio = 1

-- dia 23/10/2026

EXECUTE AS USER = 'admin_sql3';

DELETE FROM Servicios  WHERE id_servicio = 1 

ALTER ROLE db_datareader
DROP MEMBER admin_sql3;

ALter role db_datawriter
DROP member admin_sql3;

ALter role db_ddladmin
DROP member admin_sql3;

-- permitir solo escritura  (INSERT, UPODATE, DELETE en todas las tablas)
ALter role db_datawriter
add member admin_sql3;

ALTER role db_datareader
add member admin_sql3;

ALTER ROLE db_ddladmin
ADD MEMBER admin_sql3;

EXECUTE AS USER = 'admin_sql3';

SELECT 
	SUSER_NAME() AS [lOGIN],
	USER_NAME() AS [USUARIO_ACTUAL]

SELECT * FROM Servicios

INSERT INTO Servicios
VALUES (3, 'cafeteria', 'Pura comida buena');

UPDATE Servicios
SET nombre = 'cafeteria8'
WHERE id_servicio = 3;

SELECT 
	pr.name AS Principal,
	pe.permission_name AS Permiso,
	pe.state_desc AS Estado,
	OBJECT_NAME(pe.major_id) AS Objeto
FROM sys.database_permission AS pe
INNER JOIN sys.database_pruincipals AS pr
ON pe.grantee_principal_id = pr.principal_id
WHERE pr.name = 'admin_sql3';

-- PERMITE ADMINISTRACION DE OBJETOS (DDL : create, alter, drop)
ALTER ROLE db_ddladmin
ADD MEMBER admin_sql3;

CREATE table prueba (
id int NOT NULL,
nombre VARCHAR(100)
)

ALTER TABLE prueba
ADD edad INT NOT NULL;

DROP TABLE prueba;
revert