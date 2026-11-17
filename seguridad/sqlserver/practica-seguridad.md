# Adminicstracion de Seguridad en SQLSERVER

## Fundamentos

| Concepto | Nivel | Propósito | Ejemplo |
|---|---|---|---|
|**Login**| Instancia de SQL server | Autenticar una identidad ante el Servidor | `admin_sql`|
|**User**| Base de datos | Representa la identidad ante el servidor |`dbo`|
|**Rol de Servidor**|   Instancia |Agrupa privilegios administrados a nivel de servidor |`sysadmin`|
|**User**| Sesión | Determinar el contexto de ejecucion de una consulta |`master`|

# 1. Diagnostico de la conexion Administrativa

**Comprobar el login actual**
```sql
SELECT SUSER_NAME () AS LoginActual;

-- Verificar los privilegios SysAdmin --


SELECT IS_SRVROLEMEMBER('sysadmin') AS [EsSysAdmin];
```
| Resultado | Interpretación |
|---|---|
|1|Pertenece al rol consultado|
|0| No pertenece a ese rol|
|NULL| No se puede determinar el resultado |
```sql
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
```

-- name -> nombre del principal
-- type_desc -> tipo de principal, para este caso el principal es SQL_LOGIN
-- is_disable -> 0 significa habilitado y el 1 desabilitado

-- Verificar la base de datos actual 
```sql
SELECT
	DB_NAME() AS BaseActual;

-- Consulta completa del contexto 

SELECT
	SUSER_SNAME() AS LoginActual,
	USER_NAME ()  AS UsuarioBaseActual,
	DB_NAME() AS BaseActual,
	iS_SRVROLEMEMBER('sysadmin') AS EsSysAdmin:
```
## Creacion y prueba de un administrador alternativo

-- Para hacer un login simpre debemos estar en master
```sql
use master 

-- crear el login admin_sql

CREATE LOGIN admin_sql
WITH PASSWORD = '<CAMBIAR_PASSWORD>',
CHECK_POLICY = ON  --> encargado de ue se cumpla una polita para la contrasena

`CREATE LOGIN admin_sql`: crea una identidad que puede autenticarse ante la instancia
`WITH PASSWORD`: Define una contraseña de autenticacion SQL Server
`CHECK_POLITY = ON` : Solicita aplicar la politica de contraseña correspondiente cuando esta disponible
 