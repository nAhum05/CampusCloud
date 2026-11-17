// 01-crear-nodos-relaciones.cypher
// 5 Estudiante, 4 Servicio, 10 relaciones USA (datos ficticios).
// MERGE evita duplicados si se ejecuta dos veces.

MERGE (a:Estudiante {id_estudiante: 1}) SET a.nombre = 'Ana Lopez',       a.carrera = 'TI';
MERGE (b:Estudiante {id_estudiante: 2}) SET b.nombre = 'Carlos Hernandez', b.carrera = 'TI';
MERGE (c:Estudiante {id_estudiante: 3}) SET c.nombre = 'Beatriz Ruiz',    c.carrera = 'Mecatronica';
MERGE (d:Estudiante {id_estudiante: 4}) SET d.nombre = 'Diego Santos',    d.carrera = 'Mecatronica';
MERGE (e:Estudiante {id_estudiante: 5}) SET e.nombre = 'Elena Mora',      e.carrera = 'TI';

MERGE (s1:Servicio {id_servicio: 1}) SET s1.nombre = 'Constancia de Estudios',  s1.categoria = 'Administrativo';
MERGE (s2:Servicio {id_servicio: 2}) SET s2.nombre = 'Prestamo de Laboratorio', s2.categoria = 'Tecnologico';
MERGE (s3:Servicio {id_servicio: 3}) SET s3.nombre = 'Biblioteca Digital',      s3.categoria = 'Academico';
MERGE (s4:Servicio {id_servicio: 4}) SET s4.nombre = 'Tutorias Academicas',     s4.categoria = 'Academico';

MATCH (e:Estudiante {id_estudiante: 1}), (s:Servicio {id_servicio: 1}) MERGE (e)-[r:USA]->(s) SET r.veces = 2, r.ultima_vez = date('2026-11-10');
MATCH (e:Estudiante {id_estudiante: 1}), (s:Servicio {id_servicio: 2}) MERGE (e)-[r:USA]->(s) SET r.veces = 5, r.ultima_vez = date('2026-11-14');
MATCH (e:Estudiante {id_estudiante: 1}), (s:Servicio {id_servicio: 3}) MERGE (e)-[r:USA]->(s) SET r.veces = 8, r.ultima_vez = date('2026-11-03');
MATCH (e:Estudiante {id_estudiante: 2}), (s:Servicio {id_servicio: 2}) MERGE (e)-[r:USA]->(s) SET r.veces = 3, r.ultima_vez = date('2026-11-09');
MATCH (e:Estudiante {id_estudiante: 2}), (s:Servicio {id_servicio: 3}) MERGE (e)-[r:USA]->(s) SET r.veces = 6, r.ultima_vez = date('2026-11-15');
MATCH (e:Estudiante {id_estudiante: 3}), (s:Servicio {id_servicio: 3}) MERGE (e)-[r:USA]->(s) SET r.veces = 4, r.ultima_vez = date('2026-11-12');
MATCH (e:Estudiante {id_estudiante: 3}), (s:Servicio {id_servicio: 4}) MERGE (e)-[r:USA]->(s) SET r.veces = 7, r.ultima_vez = date('2026-11-13');
MATCH (e:Estudiante {id_estudiante: 4}), (s:Servicio {id_servicio: 1}) MERGE (e)-[r:USA]->(s) SET r.veces = 1, r.ultima_vez = date('2026-11-05');
MATCH (e:Estudiante {id_estudiante: 4}), (s:Servicio {id_servicio: 4}) MERGE (e)-[r:USA]->(s) SET r.veces = 3, r.ultima_vez = date('2026-11-11');
MATCH (e:Estudiante {id_estudiante: 5}), (s:Servicio {id_servicio: 2}) MERGE (e)-[r:USA]->(s) SET r.veces = 2, r.ultima_vez = date('2026-11-08');

// Verificación
MATCH (n) RETURN labels(n)[0] AS tipo, count(*) AS total;
MATCH ()-[r:USA]->() RETURN count(r) AS relaciones_USA;
