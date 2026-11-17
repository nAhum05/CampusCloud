-- 06-limitaciones.cql  (esta consulta DEBE fallar; sirve de evidencia)
-- Filtrar por una columna que no es parte de la clave, sin partition key,
-- obligaría a leer todas las particiones: Cassandra lo rechaza.
USE campuscloud;
SELECT * FROM eventos_por_estudiante WHERE tipo_evento = 'login';
