import { ObjectId } from "mongodb";
import {
    obtenerCatalogo
} from "../repositories/catalogo.repository.js";

export const listarCatalogoActivo = async() =>{

     const documentos = await obtenerCatalogo(); 

     const activos = documentos.filter(servicio => servicio.activo===true);

     return activos;
}
