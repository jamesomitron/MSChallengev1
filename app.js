// Express creates our server
// cors is to allow and fredirect sources
// Router is where our api routes will be defined
// AppError and errorHandler are our global error handler functions

const express = require('express');
const cors = require("cors");
const router = require("./routes");
const AppError = require("./utils/appError");
const errorhandler = require("./utils/errorHandler");
const conn = require('./services/db');

const app = express();

// app.get("/", (req, res) => {
//     res.json({ message: "ok" });
// });

// app.get("/:id", (req, res) => {
//     const id = req.params?.id;

//     conn.query("SELECT * FROM books")
// })

app.use(router);

app.all("*", (req, res, next) => {
    next(new AppError(`The URL ${req.originalUrl} does not exist`, 404));
});

app.use(errorhandler);

// Configure app to listen to port 3000
const PORT = 8080;

app.listen(PORT, () => {
    console.log(`server running on port ${PORT}`);
});

module.exports = app;