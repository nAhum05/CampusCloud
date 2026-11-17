// 01-crear-coleccion.js
// Crea la colección de detalles extendidos y sus índices.
db = db.getSiblingDB('campuscloud_nosql');

if (!db.getCollectionNames().includes('servicios_detalle')) {
  db.createCollection('servicios_detalle');
}
// codigo único; id_servicio_sql referencia a Servicios.id_servicio de SQL Server
db.servicios_detalle.createIndex({ codigo: 1 }, { unique: true });
db.servicios_detalle.createIndex({ id_servicio_sql: 1 });

printjson(db.getCollectionNames());
