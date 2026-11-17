// 06-agregacion.js
// Conteo de servicios por categoria y promedio de tiempo de respuesta.
db = db.getSiblingDB('campuscloud_nosql');

printjson(db.servicios_detalle.aggregate([
  { $group: {
      _id: '$categoria',
      total: { $sum: 1 },
      promedio_respuesta_horas: { $avg: '$caracteristicas.tiempo_respuesta_horas' }
  } },
  { $sort: { total: -1 } }
]).toArray());
