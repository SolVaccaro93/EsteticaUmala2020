const express = require('express');
const router = express.Router();
const serviceProducts = require('./../models/producto');
// productos/single/1
router.get('/single/:id', async(req, res) => {
        const id = req.params.id; // obtenemos el id que llega mediante la URL
        const producto = await serviceProducts.getProduct(id);
        res.render('producto', { producto, precio_previo: producto.precio * 1.2 });
    })
    // productos/all
router.get('/all', async(req, res) => {

})

router.get('/group/:id_categoria', async(req, res) => {
    const id_categoria = req.params.id; // obtenemos el id que llega mediante la URL
    const productos = await serviceProducts.getProductCat(id_categoria);
    res.render('producto', { productos });
})


module.exports = router;