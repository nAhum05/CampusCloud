import { Router } from "express";
import {
    obtenerCatalogoController
} from "../controllers/catalogo.controller.js"


const router = Router();
router.get("/catalogo", obtenerCatalogoController);

export default router;