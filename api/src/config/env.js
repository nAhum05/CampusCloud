// Importa la dependecia instalada
import dotenv from "dotenv";

//Carga las variables del archivo.env a proccess.env
dotenv.config();

const PORT = Number(process.env.PORT ?? 3000);

if (!Number.isInteger(PORT) || PORT < 1 || PORT > 65535) {
    throw new Error("PORT debe ser un puerto valido entre 1 y 65535");    
}

//Configuracion de mongodb
const MONGO_DB = process.env.MONGO_DB
const MONGO_PORT =Number(process.env.MONGO_PORT)
const MONGO_USER = process.env.MONGO_USER
const MONGO_PASSWORD = process.env.MONGO_PASSWORD
const MONGO_DATABASE = process.env.MONGO_DATABASE
const MONGO_AUTH_SOURCE= process.env.MONGO_AUTH_SOURCE


// Validar que no falte ninguna variable
if(
!MONGO_DB ||
!MONGO_PORT ||
!MONGO_USER ||
!MONGO_PASSWORD || 
!MONGO_DATABASE ||
!MONGO_AUTH_SOURCE
){
    throw new Error("Faltan variables de configuracion ");
}
if(!Number.isInteger(MONGO_PORT) || MONGO_PORT < 1 || MONGO_PORT > 65536){
    throw new Error("MONGO_PORT debe ser un puerto valido");
    
}
export const env = {
    port: PORT,
    mongo:{
        host:MONGO_DB,
        port:MONGO_PORT,
        user:MONGO_USER,
        password:MONGO_PASSWORD,
        database:MONGO_DATABASE,
        authSource:MONGO_AUTH_SOURCE
    }
}