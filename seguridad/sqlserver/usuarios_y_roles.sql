 -- Seleccionar a master y crear la base de datos
 
 Use master
 
 
 CREATE DATABASE empresaVentas;
 
 
 -- verificar que la bd existe
 
 SELECT
 	name,
 	state_desc
 FROM sys.databases
 WHERE name = 'empresaVentas';
 
 
 USE empresaVentas
 
 CREATE TABLE dbo.productos (
 	Idproductos INT PRIMARY KEY, 
 	Nombre VARCHAR(100) NOT NULL,
 	Precio DECIMAL(10, 2) NOT NULL,
 	Existencia INT NOT NULL
 );
 
 CREATE TABLE dbo.clientes (
 	IdCliente INT PRIMARY KEY,
 	Nombre VARCHAR(100) NOT NULL,
 	Correo VARCHAR(150)  
 )
 
 CREATE TABLE dbo.Ventas (
  IdVenta INT PRIMARY KEY,
  idCliente INT NOT NULL,
  Fecha DATE NOT NULL,
  Total DECIMAL (10, 2) NOT NULL
 );

use empresaVentas;
CREATE SCHEMA rh;

CREATE TABLE rh.nomina (
	id INT PRIMARY KEY IDENTITY (1,1),
	numero_nomina VARCHAR(50) NOT NULL UNIQUE,
	total DECIMAL (10,2) NOT NULL
	CHECK (total > 0.0)
);

INSERT INTO dbo.productos (Idproductos,Nombre,Precio,Existencia)
VALUES 
(1, 'Laptop', 18000.0, 10),
(2, 'Monitor', 4500.0, 20),
(3, 'Teclado', 850.00, 35),
(4, 'Mouse', 450.0, 50),
(5, 'Impresora', 6200.00, 8);

INSERT INTO dbo.clientes (IdCliente,Nombre,Correo)
VALUES
(1,'Empresa Alfa', 'contacto@alfa.com'),
(2, 'Empresa Beta','ventas@beta.com'),
(3, 'Comercial Gamma','compra@gamma.com'),
(4, 'Servicio Delta','contacto@dalta.com'),
(5, 'Industrial Omega','ventas@omega.com');

INSERT INTO dbo.Ventas (IdVenta, idCliente, Fecha, Total)
VALUES
(1,1, '2026-10-01', 18000.0),
(2,2, '2026-10-01', 4500);

SELECT * FROM dbo.clientes;
SELECT * FROM dbo.productos;
SELECT * FROM dbo.Ventas;

-- Crear login operativo vendedor1

use master;

SELECT DB_NAME() AS [Base de datos actual]

-- CREAR LOGIN
CREATE LOGIN vendedor1
WITH PASSWORD = '<CAMBIAR_PASSWORD>',
CHECK_POLICY = ON;

SELECT
name,
type_desc,
is_disabled
FROM sys.server_principals
WHERE name = 'vendedor1';

-- VERIFICAR QUE ESTE LOGIN NO SEA SYSADMIN

SELECT 
	IS_SRVROLEMEMBER ('sysadmin', 'vendedor1') AS EsSysadmin;
	

-- Crear el usuario al login

USE empresaVentas;

CREATE USER vendedor1 
FROM LOGIN vendedor1;

SELECT
	name,
	type_desc,
	authentication_type_desc
FROM sys.database_principals
WHERE name = 'vendedor1';

-- Concederle permisos de SELECT directamente al usuario

GRANT SELECT
ON dbo.productos
TO vendedor1;

REVOKE SELECT
ON dbo.productos
FROM vendedor1;


SELECT
	pr.name AS Principal,
	pe.permission_name AS Permiso,
	pe.statu_desc AS Estado,
	OBJECT_NAME(pe.major_id) AS Objeto
FROM sys.database_permissions AS pe
INNER JOIN sys.database_principals AS pr
ON pe.grantee_pricipal_id = pr.principal_id
WHERE pr.name = 'vendedor1';

-- Conceder varios permisos al usuario

GRANT SELECT
ON dbo.productos
TO vendedor1;

GRANT SELECT
ON dbo.clientes
TO vendedor1;

GRANT SELECT
ON dbo.Ventas
TO vendedor1;

GRANT INSERT
ON dbo.Ventas
TO vendedor1;

GRANT SELECT
ON rh.nomina
TO vendedor1;

SELECT 
SUSER_NAME() AS LoginActual,
USER_NAME() AS UsuarioActual,
DB_NAME() AS BaseActual

-- Crear un rol_vendedor y administracion de permisos mediante roles

CREATE ROLE rol_vendedor;


-- Verificar el rol 

SELECT
	name,
	type_desc
FROM sys.database_principals
WHERE name = 'rol_vendedor';

-- Quitar el permiso a vendedor1 de la tabla productos
REVOKE SELECT
ON dbo.productos
FROM vendedor1;

-- agregar vendedor1 al rol rol_vendedor
ALTER ROLE rol_vendedor
ADD MEMBER vendedor1;

-- Verificar la menbresia del usuario en el rol 
SELECT
	r.name as [Rol],
	u.name as [Usuario]
FROM sys.database_role_members AS drm
INNER JOIN sys.database_principals AS r 
ON drm.role_principal_id = r.principal_id
JOIN sys.database_principals AS u 
ON drm.member_principal_id = u.principal_id
WHERE r.name = 'rol_vendedor';

-- Conceder permisos de SELECT sobre productos al rol

GRANT SELECT
ON dbo.productos
TO rol_vendedor;

GRANT SELECT, INSERT, UPDATE
ON dbo.clientes
TO rol_vendedor;

GRANT SELECT
ON dbo.Ventas
TO rol_vendedor;

GRANT INSERT
ON dbo.Ventas
TO rol_vendedor;

GRANT SELECT
ON rh.nomina
TO rol_vendedor;

-- CREAR LOGIN para vendedor2
CREATE LOGIN vendedor2
WITH PASSWORD = '<CAMBIAR_PASSWORD>',
CHECK_POLICY = ON;

SELECT
name,
type_desc,
is_disabled
FROM sys.server_principals
WHERE name = 'vendedor2';

-- Crear el usuario2 al login asociado a el login vendedor2
-- Los users son por base de datos

USE empresaVentas;

CREATE USER vendedor2 
FROM LOGIN vendedor2;

SELECT
	name,
	type_desc,
	authentication_type_desc
FROM sys.database_principals
WHERE name = 'vendedor2';

-- Agregar como miembro del rol vendedor al user vendedor2

ALTER ROLE rol_vendedor
ADD MEMBER vendedor2;

-- Consulta los permisos del rol

SELECT
	pr.name AS Principal,
	pe.permission_name AS Permiso,
	pe.state_desc AS Estado,
	OBJECT_NAME(pe.major_id) AS Objeto
FROM sys.database_permissions AS pe 
INNER JOIN sys.database_principals AS pr 
ON pe.grantee_principal_id = pr.principal_id
WHERE pr.name = 'rol_vendedor';