// 02-insertar-documentos.js
// 6 documentos, 3 categorías (Administrativo, Tecnologico, Academico),
// con arrays y subdocumentos. Reiniciable: borra y vuelve a cargar.
db = db.getSiblingDB('campuscloud_nosql');

db.servicios_detalle.deleteMany({});

const resultado = db.servicios_detalle.insertMany([
  {
    codigo: 'SRV-001', id_servicio_sql: 1, nombre: 'Constancia de Estudios',
    categoria: 'Administrativo', activo: true,
    modalidades: ['Presencial', 'Digital'],
    etiquetas: ['tramite', 'documento'],
    caracteristicas: {
      costo: 0, tiempo_respuesta_horas: 48,
      requisitos: ['Matricula vigente', 'Identificacion'],
      contacto: { area: 'Servicios Escolares', extension: 101 }
    }
  },
  {
    codigo: 'SRV-002', id_servicio_sql: 2, nombre: 'Prestamo de Laboratorio',
    categoria: 'Tecnologico', activo: true,
    modalidades: ['Presencial'],
    etiquetas: ['laboratorio', 'equipo'],
    caracteristicas: {
      costo: 0, tiempo_respuesta_horas: 24, capacidad: 30,
      equipamiento: ['Computadoras', 'Proyector', 'Red local'],
      horario: { apertura: '08:00', cierre: '18:00' }
    }
  },
  {
    codigo: 'SRV-003', id_servicio_sql: 3, nombre: 'Biblioteca Digital',
    categoria: 'Academico', activo: true,
    modalidades: ['Digital'],
    etiquetas: ['libros', 'consulta'],
    caracteristicas: {
      costo: 0, tiempo_respuesta_horas: 1,
      recursos: ['Libros digitales', 'Revistas', 'Bases de datos academicas']
    }
  },
  {
    codigo: 'SRV-004', id_servicio_sql: 4, nombre: 'Tutorias Academicas',
    categoria: 'Academico', activo: true,
    modalidades: ['Presencial', 'Digital'],
    etiquetas: ['tutoria', 'apoyo'],
    caracteristicas: {
      costo: 0, tiempo_respuesta_horas: 72,
      requisitos: ['Matricula vigente'],
      horario: { apertura: '10:00', cierre: '16:00' }
    }
  },
  {
    codigo: 'SRV-005', id_servicio_sql: 5, nombre: 'Soporte de Cuenta Institucional',
    categoria: 'Tecnologico', activo: true,
    modalidades: ['Digital'],
    etiquetas: ['cuenta', 'correo'],
    caracteristicas: {
      costo: 0, tiempo_respuesta_horas: 12,
      canales: ['Correo', 'Mesa de ayuda']
    }
  },
  {
    codigo: 'SRV-006', id_servicio_sql: 6, nombre: 'Tramite de Credencial',
    categoria: 'Administrativo', activo: false,
    modalidades: ['Presencial'],
    etiquetas: ['credencial', 'tramite'],
    caracteristicas: {
      costo: 50, tiempo_respuesta_horas: 120,
      requisitos: ['Fotografia', 'Comprobante de pago']
    }
  }
]);

print('Documentos insertados: ' + Object.keys(resultado.insertedIds).length);
print('Total en la coleccion: ' + db.servicios_detalle.countDocuments());
