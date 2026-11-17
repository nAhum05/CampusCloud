-- 01-crear-keyspace-tabla.cql
-- Diseño a partir de la consulta: "actividad de un estudiante en un periodo".
--   Partition key : id_estudiante  -> todos los eventos de un estudiante en una partición
--   Clustering    : fecha_hora DESC, id_evento -> ordenados por fecha (rango eficiente)
CREATE KEYSPACE IF NOT EXISTS campuscloud
  WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE campuscloud;

CREATE TABLE IF NOT EXISTS eventos_por_estudiante (
  id_estudiante int,
  fecha_hora    timestamp,
  id_evento     uuid,
  tipo_evento   text,
  id_servicio   int,
  detalle       text,
  PRIMARY KEY ((id_estudiante), fecha_hora, id_evento)
) WITH CLUSTERING ORDER BY (fecha_hora DESC, id_evento ASC);

DESCRIBE TABLE eventos_por_estudiante;
