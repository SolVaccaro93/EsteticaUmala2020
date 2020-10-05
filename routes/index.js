const express = require("express");
const router = express.Router();
const productoService = require("./../models/producto");
const { getCategories } = require("./../models/categoria");
const { getTestimonios } = require("./../models/testimonio");
router.get("/", async(req, res) => {
    const productos = await productoService.getProducts();
    const categorias = await getCategories();
    const testimonios = await getTestimonios();
    console.log(req.session.username)
    res.render("index", {
        title: "Estetica Sol",
        productos,
        categorias,
        testimonios,

    });
});

module.exports = router;