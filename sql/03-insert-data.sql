use CampusCloud;

INSERT INTO Estudiantes (Id_Estudiante, Matricula, Nombre, Correo)

VALUES (1, '20260001', 'Ana Lopez', 'ana@universidad.com'),
		(2, '2026002', 'Carlos Hernandez', 'carlos@universidad.com');


INSERT INTO Servicios (id_servicio, Nombre, Descripcion)
VALUES (1, 'Constancia de Estudios', 'Solicitud de constancia academica')
		(2, 'Prestamo de Laboratorio', 'Se Reservo equipo o espacio de laboratorio');
		
INSERT INTO Solicitudes (id_solicitud, id_estudiante, id_servicio, fecha, estado)
VALUES (1001, 1, 1, '2026-10-21', 'Pendiente')
		(1002, 2, 2, '2026-10-22', 'Pendiente');