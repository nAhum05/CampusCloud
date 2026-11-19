// 05-eliminar.js
// Eliminación por identificador (_id) del documento SRV-006.
// Nota: el if/else va en UNA sola línea porque mongosh lee el script por
// stdin línea por línea; un "else" en línea aparte genera SyntaxError.
db = db.getSiblingDB('campuscloud_nosql');
const col = db.servicios_detalle;

print('--- ANTES --- total: ' + col.countDocuments());
const doc = col.findOne({ codigo: 'SRV-006' });
if (!doc) { print('SRV-006 no existe (ya fue eliminado).'); } else { print('Eliminando _id: ' + doc._id); const r = col.deleteOne({ _id: doc._id }); print('Eliminados: ' + r.deletedCount); }
print('--- DESPUES --- total: ' + col.countDocuments());
printjson(col.find({ codigo: 'SRV-006' }).toArray());
