
export const obtenerSalud =(_req, res) => {res.status(200),json({
        estado: "ok",
        aplication: "campusCloud API",
        mensaje: "El servidor esta funcionando"
    });
};
