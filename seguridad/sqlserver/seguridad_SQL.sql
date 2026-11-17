SELECT SUSER_NAME () AS LoginActual;

-- Verificar los privilegios SysAdmin --


SELECT IS_SRVROLEMEMBER('sysadmin') AS [EsSysAdmin];

| Resultado | Interpretación |
|---|---|
|1|Pertenece al rol consultado|
|0| No pertenece a ese rol|
|NULL| No se puede determinar el resultado |

SELECT 
	SUSER_NAME () AS LoginActual,
	iS_SRVROLEMEMBER('sysadmin') AS [EsSysAdmin]
	
-- colsulta el estado de sa 

SELECT
	name,
	type_desc,
	is_disabled
FROM
	sys.server_principals
WHERE	 name = 'sa'


-- name -> nombre del principal
-- type_desc -> tipo de principal, para este caso el principal es SQL_LOGIN
-- is_disable -> 0 significa habilitado y el 1 desabilitado

-- Verificar la base de datos actual 

SELECT
	DB_NAME() AS BaseActual;

-- Consulta completa del contexto 

SELECT
	SUSER_SNAME() AS LoginActual,
	USER_NAME ()  AS UsuarioBaseActual,
	DB_NAME() AS BaseActual,
	iS_SRVROLEMEMBER('sysadmin') AS EsSysAdmin;

-- Creacion y Prueba de un administrador alternativo

-- Para hacer un login simpre debemos estar en master

use master 

-- crear el login admin_sql

CREATE LOGIN admin_sql
WITH PASSWORD = '<CAMBIAR_PASSWORD>',
CHECK_POLICY = ON  --> encargado de ue se cumpla una polita para la contrasena

-- verificar si existe y esta habilitado 

SELECT 
	name,
	type_desc,
	is_disabled
FROM sys.server_principals
WHERE name = 'admin_sql'

-- Demostrar que crear un login no lo hace administrador

SELECT IS_SRVROLEMEMBER ('sysadmin' ,'admin_sql') AS EsSysAdmin

-- Agregar admin_sql al rol de servidor sysadmin

ALTER SERVER ROLE sysadmin
ADD MEMBER admin_sql;

--validar la nueva membresia

SELECT IS_SRVROLEMEMBER ('sysadmin' ,'admin_sql') AS EsSysAdmin

## Deshabilitacion controlada de sa

SELECT
	name,
	type_desc,
	is_disabled
FROM
	sys.server_principals
WHERE	 name = 'sa'

**deshabilitar sa**

ALTER LOGIN sa DISABLE
