
-- Permisos sobre tablasy vistas
-- Asignacion directa a usuarios por roles sobre tablas especificas

EXECUTE AS USER = 'admin_sql3';

SELECT 
	SUSER_NAME() AS [lOGIN],
	USER_NAME() AS [USUARIO_ACTUAL]

REVERT;

use CampusCloud;

CREATE VIEW 
SELECT
e.nombre,
s.fecha,
s.estado
FROM Estudiantes AS e 
INNER JOIN Solicitudes AS s 
ON e.id_estudiante = s.id_estudiante
WHERE DATEPART(YEAR, s.fecha) = '2026';

-- Permitir la lectura en una tabla especifica

GRANT SELECT ON dbo.Estudiantes TO admin_sql3;

EXECUTE AS USER = 'admin_sql3';

SELECT * FROM dbo.Servicios;

SELECT * FROM dbo.Socitudes;

REVERT

-- permitir insersion y actualizacion en una tabla (servicios)

GRANT INSERT, UPDATE ON dbo.Servicios TO admin_sql3;

GRANT SELECT ON dbo.Servicios TO admin_sql3;

EXECUTE AS USER = 'admin_sql3';

SELECT * FROM Estudiantes;

INSERT INTO Servicios
VALUES (5, 'Becas', 'Mucho Dinero');

UPDATE Servicios
SET descripcion = 'Poco Dinero'
WHERE id_servicio = 5;

-- Permisos total de codigo sql DML sobre una tabla
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Socitudes TO admin_sql3;

SELECT
* 
FROM Socitudes;

INSERT INTO Socitudes
VALUES (1003, 3,3,'2026-10-23', 'Terminado');

UPDATE Socitudes
SET estado = 'Pendiente'
WHERE id_solicitud = 1003;

DELETE Socitudes
WHERE id_solicitud = 1003;

-- Denegar explicitamente la eliminación de registros (Bloquep)

DENY DELETE ON dbo.Socitudes TO admin_sql3;

EXECUTE AS USER = 'admin_sql3';

-- Quitar los permisos

REVOKE UPDATE, DELETE, INSERT, SELECT ON dbo.Socitudes FROM admin_sql3

REVERT;