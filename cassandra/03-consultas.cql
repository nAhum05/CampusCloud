-- 03-consultas.cql
USE campuscloud;

-- Toda la actividad del estudiante 1 (más reciente primero)
SELECT id_estudiante, fecha_hora, tipo_evento, id_servicio, detalle
FROM eventos_por_estudiante WHERE id_estudiante = 1;

-- Actividad del estudiante 1 en un periodo (rango sobre la clustering key)
SELECT id_estudiante, fecha_hora, tipo_evento, id_servicio, detalle
FROM eventos_por_estudiante
WHERE id_estudiante = 1
  AND fecha_hora >= '2026-11-03 00:00:00'
  AND fecha_hora <  '2026-11-11 00:00:00';
