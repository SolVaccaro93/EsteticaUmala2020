var express = require('express');
var router = express.Router();
var { createUser } = require('../models/usuario');

/* GET users listing. */
router.get('/', function(req, res, next) {
    res.render('registro');
});

router.post("/", async(req, res) => {
    try {
        // console.log(req.body)
        // console.log(req.file)
        const { username, password, name, lastname, mail } = req.body;
        const obj = {
            username,
            password,
            name,
            lastname,
            mail,
        }
        const result = await createUser(obj);
        res.json({ success: true });
    } catch (error) {
        res.json({ success: false });
        // error.hbs
    }
});


module.exports = router;