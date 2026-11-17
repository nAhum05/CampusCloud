
//Importar express que se instalo previamente
import express from "express";

// Importar el router salud
import saludRoutes from "./routes/salud.router.js";

//crea una aplicacion express, apartir de este objeto
//se prodran configurar rutas y middlewares

const app = express();

// Agrega un middlewares que permite inyertar cuerpos Json de las peticiones HTTP
app.use(express.json());

// Registrar la ruta
app.use(saludRoutes);

export default app;