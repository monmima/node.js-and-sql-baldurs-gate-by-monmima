// https://www.youtube.com/watch?v=EN6Dx22cPRI

const express = require("express");
const path = require('path');
const bodyParser = require('body-parser'); // needed to read the content from the form
const mysql = require("mysql");

// using express and the body-parser module
const app = express();
app.use(bodyParser.urlencoded({ extended: false }));

// create connection
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",

    // once the app is create you can uncommented the next line
    // (one of them if there are two lines below)
    // database: "node_and_sql_aide_memoire_db"
    database: "bg_db"
});

// connect
db.connect((err) => {
    if (err) {
        throw err;
    }

    console.log("MySql connected...");
});

/**
 * EJS
 * concatenate the current working directory
 * and a folder called views
 */
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

/**
 * serving static files from the "public" folder
 * this includes: image, HTML and JS files, etc.
 */
app.use(express.static(path.resolve(__dirname, 'public')));

// read/select all
app.get("/get-characters", (req, res) => {

    let sql = "SELECT * FROM membres_tb ORDER BY first_name_mb";
    let query = db.query(sql, (err, myRes) => {
        if (err) {
            res.status(200).send("Are you sure you have created a table?");
            throw err;

        } else {
            // console.log(myRes);
            // res.status(200).send(myRes);

            res.status(200).json(myRes);

            // res.status(200).send((myRes));
        }
    });
});

// select single item
app.get("/character-info/:id", (req, res) => {

    let sql = `SELECT * FROM pays_tb INNER JOIN membres_tb ON membres_tb.country_mb = pays_tb.id_area WHERE id_mb = ${req.params.id}`;

    let query = db.query(sql, (err, myRes) => {
        if (err) {
            throw err;
        } else {
            // res.status(200).json(myRes);
            res.status(200).render("character-info", { member: myRes });
            console.log(myRes);
        }
    });
});

/**
 * EJS template 2
 * https://www.w3schools.com/nodejs/shownodejs_cmd.asp?filename=demo_mongodb_query
 */
app.get('/ejs-2', (req, res) => {
    res.status(200).render("ejs-2", {
        node: {
            dirname: __dirname,
            filename: __filename
        }
    });
});

/**
 * EJS template 3
 * https://www.w3schools.com/nodejs/shownodejs_cmd.asp?filename=demo_mongodb_query
 */
app.get('/portraits', (req, res) => {
    let sql = "SELECT * FROM membres_tb ORDER BY first_name_mb";

    db.query(sql, (err, myRes) => {
        if (err) {
            throw err;
        } else {
            // console.log(myRes);

            res.status(200).render("portraits", { member: myRes });

        }
    });
});

/**
 * handling 404 errors
 * source: https://expressjs.com/en/starter/faq.html
 */
app.use(function (req, res, next) {
    res.status(404).send("404 - Sorry can't find that!")
});

app.listen("3000", () => {
    console.log("Server started on port 3000");
});