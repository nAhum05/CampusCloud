// 02-consultas.cypher
// Consulta 1: servicios usados por un estudiante (Ana Lopez)
MATCH (e:Estudiante {nombre: 'Ana Lopez'})-[u:USA]->(s:Servicio)
RETURN s.nombre AS servicio, u.veces AS veces
ORDER BY veces DESC;

// Consulta 2: estudiantes que comparten un servicio (Biblioteca Digital)
MATCH (e:Estudiante)-[:USA]->(s:Servicio {nombre: 'Biblioteca Digital'})
RETURN s.nombre AS servicio, collect(e.nombre) AS estudiantes, count(e) AS total;

// Consulta 3: recomendacion basica para Ana Lopez
// Servicios usados por quienes comparten servicios con ella y que ella aun no usa.
MATCH (a:Estudiante {nombre: 'Ana Lopez'})-[:USA]->(:Servicio)<-[:USA]-(otro:Estudiante)-[:USA]->(rec:Servicio)
WHERE NOT (a)-[:USA]->(rec)
RETURN rec.nombre AS servicio_recomendado, count(DISTINCT otro) AS afinidad
ORDER BY afinidad DESC;
