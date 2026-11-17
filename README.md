# CampusCloud

Proyecto académico de la asignatura Bases de Datos en la Nube.

## Objetivo

Construir progresivamente una Nube Académica Local que permita comprender:

- bases de datos relacionales;
- bases de datos NoSQL;
- persistencia;
- usuarios, roles y privilegios;
- conexión local y remota;
- integración mediante API;
- Docker y Docker Compose como herramientas de soporte.

## Unidad I

Primera implementación:

PC → Docker → SQL Server → Volumen → CampusCloud

Tecnología inicial:

- Docker Desktop
- SQL Server 2025
- Cliente SQL
- Git
- Visual Studio Code

## Unidad II

Segunda implementación:

PC → Docker Compose → MongoDB / Neo4j / Cassandra → Volúmenes → CampusCloud

En esta unidad se agregan tres bases de datos NoSQL que complementan a SQL Server. No lo sustituyen: se relacionan con él mediante el identificador del servicio (`id_servicio`).

### Tecnologías

- MongoDB: guarda detalles extendidos de los servicios (documentos).
- Neo4j: guarda las relaciones entre estudiantes y servicios (grafos).
- Cassandra: guarda los eventos de uso (columnas anchas).
- Docker Compose (archivo `campus-cloud-proyect/docker-composev8.yml`)

### Requisitos

- Docker Desktop
- Git Bash o una terminal
- MongoDB Compass (opcional, para ver los documentos)

Nota: el equipo tiene poca memoria, así que se recomienda levantar **un gestor a la vez**.

### Configuración inicial

1. Crear la red de Docker (solo la primera vez):

```bash
docker network create campus-network
```

2. En la carpeta `campus-cloud-proyect/`, copiar el archivo `.env.example` como `.env` y cambiar las contraseñas.

El archivo `.env` no se sube a GitHub porque contiene credenciales.

### Cómo levantar cada servicio

Desde la carpeta `campus-cloud-proyect/`:

```bash
docker compose -f docker-composev8.yml up -d mongo
docker compose -f docker-composev8.yml up -d neo4j
docker compose -f docker-composev8.yml up -d cassandra
```

Para verificar que están funcionando:

```bash
docker compose -f docker-composev8.yml ps
```

Para detener uno:

```bash
docker compose -f docker-composev8.yml stop mongo
```

Cassandra tarda de 1 a 3 minutos en estar lista. Antes de levantarla conviene detener los demás servicios para liberar memoria.

### Cómo ejecutar los scripts

Se ejecutan desde la raíz del repositorio (la carpeta `CampusCloud`). Las contraseñas las toma el contenedor, por eso no se escriben en el comando.

MongoDB (scripts del 01 al 06):

```bash
docker exec -i campuscloud-mongo sh -c 'mongosh -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase admin --quiet' < mongodb/01-crear-coleccion.js
```

Neo4j (scripts del 01 al 03):

```bash
docker exec -i campuscloud-neo4j sh -c 'cypher-shell -u neo4j -p "${NEO4J_AUTH#neo4j/}"' < neo4j/01-crear-nodos-relaciones.cypher
```

Cassandra (scripts del 01 al 06):

```bash
docker exec -i campuscloud-cassandra cqlsh < cassandra/01-crear-keyspace-tabla.cql
```

### Estructura de las carpetas nuevas

- `mongodb/`: scripts `.js` (crear colección, insertar, consultas, actualizar, eliminar y agregación)
- `neo4j/`: scripts `.cypher` (crear nodos y relaciones, consultas y actualización)
- `cassandra/`: scripts `.cql` (crear tabla, insertar, consultas, actualizar, eliminar y limitaciones)
- `evidencias/unidad-ii/`: capturas de cada práctica

### Resultados esperados

- MongoDB: 6 documentos en la colección `servicios_detalle`. Al final, la agregación muestra Academico 2, Tecnologico 2 y Administrativo 1.
- Neo4j: 5 estudiantes, 4 servicios y 10 relaciones. La recomendación para Ana Lopez es Tutorias Academicas.
- Cassandra: 12 eventos. El estudiante 1 tiene 2 eventos entre el 3 y el 11 de noviembre. El script `06` falla a propósito, porque muestra una limitación de Cassandra.

### Seguridad

- No se suben contraseñas ni archivos `.env` al repositorio.
- Solo se suben los archivos `.env.example`, que traen valores de ejemplo.
- Los scripts y las capturas no deben mostrar contraseñas reales.
