use CampusCloud

SELECT * FROM Estudiantes;

INSERT INTO Estudiantes 
values (3, '2045601', 'Maximina Buen Rostro', 'maxi@universidad.com')

UPDATE Estudiantes
SET nombre = 'Maxima Mal Rostro'
WHERE id_estudiante = 3;

DELETE Estudiantes
WHERE id_estudiante = 3;


-- Cambiar AL contexto del USUARIO

EXECUTE AS USER = 'consulta_campus';

SELECT * FROM Estudiantes

REVERT;

EXECUTE AS USER = 'operador_campus'

SELECT 
	SYSTEM_USER AS [LoginOriginal],
	CURRENT_USER AS [USUARIO_ACTUAL],
	USER_NAME() AS [NOMBRE_USUARIO]
	
	SELECT * FROM Servicios
	
	INSERT INTO Estudiantes
	VALUES (4, '2045601', 'Maximina Buen Rostro', 'maxi@universidad.com')
	
	UPDATE Estudiantes
	SET nombre = 'Maxima Mal Rostro'
	WHERE id_estudiante = 4;
	
	DELETE Estudiantes
	WHERE id_estudiante = 4
	
	REVERT;
	