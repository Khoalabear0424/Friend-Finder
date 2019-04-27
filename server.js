var methodOverride = require('method-override')
// https://www.npmjs.com/package/body-parser
var bodyParser = require('body-parser')
var express = require('express');
var app = express();

app.use(methodOverride('_method'))
app.use(express.static("public"));

//integrate body-parser with express
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())


var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'friend_finder_db'
});

connection.connect();

app.get('/questions.json', function (req, res) {
    connection.query('SELECT * FROM questions', function (error, results, fields) {
        if (error) res.send(error)
        else res.json(results);
    });
});

app.post('/find-friend-match', function (req, res) {
    // connection.query('INSERT INTO animals (animal_name) VALUES (?)', [req.body.animal_name], function (error, results, fields) {
    //     if (error) res.send(error)
    //     else res.redirect('/');
    // });
    res.send(req.body.user_name)
});


app.listen(3001, function () {
    console.log('listening on 3001');
});






