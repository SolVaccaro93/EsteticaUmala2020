var createError = require("http-errors");
var express = require("express");
var router = express.Router();
var path = require("path");
var session = require("express-session");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
const dotenv = require("dotenv");
dotenv.config();

var indexRouter = require("./routes/index");
const productosRouter = require("./routes/productos");
const contactoRouter = require("./routes/contacto");
const adminProductosRouter = require("./routes/admin/productos");
const loginRouter = require("./routes/login");
const registroRouter = require("./routes/registro");
const testimonioRouter = require("./routes/testimonio");
var app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hbs");

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use(session({
    secret: '1234',
    resave: true,
    saveUninitialized: true
}));

app.use("/", indexRouter);
app.use("/productos", productosRouter);
app.use("/contacto", contactoRouter);
app.use("/login", loginRouter);
app.use("/registro", registroRouter);
app.use("/testimonio", testimonioRouter);

/* Admin */
app.use("/admin/productos", adminProductosRouter);

app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get("env") === "development" ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render("error");
});

module.exports = app;