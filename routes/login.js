var express = require('express');
var router = express();
var session = require('express-session');
const { logueado } = require('../models/usuario');


router.get('/', function(req, res, next) {
    res.render('login', { title: 'Estetica Umala - Login' });
});

router.post("/", async(req, res, next) => {
    try {
        var usuario = req.body.usuario;
        var pass = req.body.password;
        const resultado = await logueado(usuario, pass);
        if (resultado.length == 1) {
            console.log('Logueado exitoso');
            req.session.username = usuario;
            if (resultado[0].admin == 1) {
                req.session.administrador = true;
                res.redirect("/admin/productos");

            } else {
                req.session.administrador = false;
                res.redirect("/");

            }
        } else {
            res.json({ success: false });
            console.log('Usuario o contraseña incorrecta');
        }
    } catch (error) {
        console.log(error);
    }


});

module.exports = router;