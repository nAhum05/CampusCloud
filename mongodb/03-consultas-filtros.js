// 03-consultas-filtros.js
// Tres consultas con filtros distintos.
db = db.getSiblingDB('campuscloud_nosql');
const col = db.servicios_detalle;

print('--- Consulta 1: igualdad por categoria = Tecnologico ---');
printjson(col.find({ categoria: 'Tecnologico' }, { _id: 0, codigo: 1, nombre: 1, categoria: 1 }).toArray());

print('--- Consulta 2: pertenencia en array (modalidad Digital) y activo = true ---');
printjson(col.find({ modalidades: 'Digital', activo: true }, { _id: 0, codigo: 1, nombre: 1, modalidades: 1 }).toArray());

print('--- Consulta 3: rango sobre subdocumento (respuesta <= 24 h) ---');
printjson(col.find(
  { 'caracteristicas.tiempo_respuesta_horas': { $lte: 24 } },
  { _id: 0, codigo: 1, nombre: 1, 'caracteristicas.tiempo_respuesta_horas': 1 }
).sort({ 'caracteristicas.tiempo_respuesta_horas': 1 }).toArray());
