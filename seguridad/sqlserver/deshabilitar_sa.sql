use master


SELECT
SUSER_NAME () LoginActual,
USER_NAME () UsuarioActual,
DB_NAME () BaseActual,
IS_SRVROLEMEMBER ('sysadmin') AS EsSysAdmin;



--- Deshabilitacion controlada de sa

SELECT
	name,
	type_desc,
	is_disabled
FROM
	sys.server_principals
WHERE	 name = 'sa'

-- deshabilitar sa

ALTER LOGIN sa DISABLE
