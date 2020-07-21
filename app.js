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

/**
 * See all characters as JSON
 */
app.get("/get-characters", (req, res) => {

    let sql = "SELECT * FROM characters_tb INNER JOIN areas_tb ON characters_tb.area_ch = areas_tb.id_area WHERE id_ch";
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

/**
 * See single character
 */
app.get("/character-info/:id", (req, res) => {

    let sql = `SELECT * FROM characters_tb INNER JOIN areas_tb ON characters_tb.area_ch = areas_tb.id_area WHERE id_ch = ${req.params.id}`;

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
 * See all portraits (EJS)
 */
app.get('/', (req, res) => {
    let sql = "SELECT * FROM characters_tb ORDER BY first_name_ch";

    db.query(sql, (err, myRes) => {
        if (err) {
            throw err;
        } else {
            // console.log(myRes);

            res.status(200).render("index.ejs", { member: myRes });

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