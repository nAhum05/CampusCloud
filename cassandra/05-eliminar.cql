-- 05-eliminar.cql
USE campuscloud;

SELECT count(*) FROM eventos_por_estudiante WHERE id_estudiante = 1;

DELETE FROM eventos_por_estudiante
WHERE id_estudiante = 1 AND fecha_hora = '2026-11-14 16:45:00' AND id_evento = 11111111-1111-1111-1111-000000000004;

SELECT count(*) FROM eventos_por_estudiante WHERE id_estudiante = 1;
SELECT fecha_hora, tipo_evento FROM eventos_por_estudiante WHERE id_estudiante = 1;
