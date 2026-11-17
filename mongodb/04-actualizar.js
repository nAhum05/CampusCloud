// 04-actualizar.js
// Actualización controlada de UN documento (SRV-005): ANTES y DESPUÉS.
db = db.getSiblingDB('campuscloud_nosql');
const col = db.servicios_detalle;

print('--- ANTES ---');
printjson(col.findOne({ codigo: 'SRV-005' }, { _id: 0, codigo: 1, etiquetas: 1, 'caracteristicas.tiempo_respuesta_horas': 1 }));

const r = col.updateOne(
  { codigo: 'SRV-005' },
  { $set: { 'caracteristicas.tiempo_respuesta_horas': 4 }, $addToSet: { etiquetas: 'prioritario' } }
);
print('Coincidencias: ' + r.matchedCount + ' | Modificados: ' + r.modifiedCount);

print('--- DESPUES ---');
printjson(col.findOne({ codigo: 'SRV-005' }, { _id: 0, codigo: 1, etiquetas: 1, 'caracteristicas.tiempo_respuesta_horas': 1 }));
