// 03-actualizacion.cypher
// Modificación controlada: Ana Lopez usó otra vez Biblioteca Digital.

// ANTES
MATCH (:Estudiante {nombre: 'Ana Lopez'})-[u:USA]->(:Servicio {nombre: 'Biblioteca Digital'})
RETURN u.veces AS veces_antes, u.ultima_vez AS ultima_vez_antes;

// UPDATE
MATCH (:Estudiante {nombre: 'Ana Lopez'})-[u:USA]->(:Servicio {nombre: 'Biblioteca Digital'})
SET u.veces = u.veces + 1, u.ultima_vez = date('2026-11-16')
RETURN u.veces AS veces_despues, u.ultima_vez AS ultima_vez_despues;
