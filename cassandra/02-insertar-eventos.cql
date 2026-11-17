-- 02-insertar-eventos.cql   (12 eventos ficticios, 3 estudiantes)
USE campuscloud;

INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (1, '2026-11-02 09:00:00', 11111111-1111-1111-1111-000000000001, 'login', 0, 'Inicio de sesion');
INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (1, '2026-11-03 10:15:00', 11111111-1111-1111-1111-000000000002, 'consulta_servicio', 3, 'Consulta Biblioteca Digital');
INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (1, '2026-11-10 11:30:00', 11111111-1111-1111-1111-000000000003, 'solicitud_creada', 1, 'Solicitud de constancia');
INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (1, '2026-11-14 16:45:00', 11111111-1111-1111-1111-000000000004, 'prestamo_laboratorio', 2, 'Prestamo de laboratorio');

INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (2, '2026-11-01 08:20:00', 22222222-2222-2222-2222-000000000005, 'login', 0, 'Inicio de sesion');
INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (2, '2026-11-05 13:10:00', 22222222-2222-2222-2222-000000000006, 'consulta_servicio', 3, 'Consulta Biblioteca Digital');
INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (2, '2026-11-09 09:40:00', 22222222-2222-2222-2222-000000000007, 'solicitud_creada', 2, 'Solicitud de laboratorio');
INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (2, '2026-11-15 17:05:00', 22222222-2222-2222-2222-000000000008, 'descarga', 3, 'Descarga de libro digital');

INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (3, '2026-11-04 10:00:00', 33333333-3333-3333-3333-000000000009, 'login', 0, 'Inicio de sesion');
INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (3, '2026-11-06 12:30:00', 33333333-3333-3333-3333-000000000010, 'consulta_servicio', 4, 'Consulta Tutorias');
INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (3, '2026-11-12 15:20:00', 33333333-3333-3333-3333-000000000011, 'solicitud_creada', 4, 'Solicitud de tutoria');
INSERT INTO eventos_por_estudiante (id_estudiante, fecha_hora, id_evento, tipo_evento, id_servicio, detalle) VALUES (3, '2026-11-13 18:00:00', 33333333-3333-3333-3333-000000000012, 'descarga', 3, 'Descarga de revista');

SELECT count(*) FROM eventos_por_estudiante;
