import {MongoClient } from "mongodb";
import {env} from "./env.js"


// Construccion de la cadena de conexion
const usuario= encodeURIComponent(env.mongo.user);
const password = encodeURIComponent(env.mongo.password);

const uri= `mongodb://${usuario}:${password}@${env.mongo.host}:${env.mongo.port}/?authSource=${encodeURIComponent(env.mongo.authSource)}`;

// Creamos un cliente reutilizable
const client =  new MongoClient(uri,
{
    serverSelectionTimeoutMS: 5000
}
)

let database = null;

//Establecer la conexion

export async function conectarMongoDB() {
    await client.connect();

    database = client.db(env.mongo.database);

    // Comprobar que mongo Responde
    await database.command({ping: 1});

    console.log("Conexion a MongoDB exitosa");

    return database;
}

// recuperar la base de datos conectada 

export function obtenerMongoDB(){
    if(!database){
        throw new Error("MongoDB todavia no esta conectado");
    }

    return database;
}

// Cerrar la conexion cuando corresponda
export async function cerrarMongoDB() {
    await client.close();
    database = null;
}