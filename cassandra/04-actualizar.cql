-- 04-actualizar.cql
-- UPDATE exige la clave primaria COMPLETA (partition + clustering).
USE campuscloud;

SELECT fecha_hora, tipo_evento, detalle FROM eventos_por_estudiante
WHERE id_estudiante = 1 AND fecha_hora = '2026-11-10 11:30:00' AND id_evento = 11111111-1111-1111-1111-000000000003;

UPDATE eventos_por_estudiante
SET detalle = 'Solicitud de constancia (aprobada)'
WHERE id_estudiante = 1 AND fecha_hora = '2026-11-10 11:30:00' AND id_evento = 11111111-1111-1111-1111-000000000003;

SELECT fecha_hora, tipo_evento, detalle FROM eventos_por_estudiante
WHERE id_estudiante = 1 AND fecha_hora = '2026-11-10 11:30:00' AND id_evento = 11111111-1111-1111-1111-000000000003;
