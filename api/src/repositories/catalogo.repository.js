import {ObjectId} from "mongodb";
import {obtenerMongoDB} from "../config/mongodb.js";

export const obtenerCatalogo = async()=>{
    const db= obtenerMongoDB();
    const coleccion = db.collection("catalogo_servicios");
    const documentos = await coleccion.find({}).toArray();

    return documentos;
     
}