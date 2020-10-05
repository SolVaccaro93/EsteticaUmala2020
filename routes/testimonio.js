var express = require('express');
var router = express.Router();
const { createTestimonio } = require('../models/testimonio');

router.get('/', function(req, res, next) {
    res.render('testimonio');
});

router.post('/nuevo', async(req, res) => {
    if (req.session.username)
        try {
            const { nombre, comentario } = req.body;
            const obj = {
                nombre,
                comentario
            }
            const Testimonio = await createTestimonio(obj)
            res.redirect("/");
            console.log("Testimonio creado");
        } catch (error) {
            console.log(error);
        }
    else res.redirect("/login");
})

module.exports = router