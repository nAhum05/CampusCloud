import {
    listarCatalogoActivo
} from "../services/catalogo.service.js"


export const obtenerCatalogoController = async (req, res, next) => {
    try {
        
        const catalogo = await listarCatalogoActivo();
        res.status(200).json({
            mensaje: "Catalogo de servicios CampusCloud",
            total: catalogo.length,
            datos: catalogo
        });
    } catch (error) {
        next(error);
    }
}