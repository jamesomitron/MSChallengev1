const mysql = require('mysql2');
const conn = mysql.createConnection({
 host: "localhost",
 user: "root",
 password: "$Imisoluwa7",
 database: "contososkatelibrary",
});

conn.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

conn.connect();

module.exports = conn;