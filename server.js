var methodOverride = require('method-override')
// https://www.npmjs.com/package/body-parser
var bodyParser = require('body-parser')
var express = require('express');
var app = express();

app.use(methodOverride('_method'))
app.use(express.static("public"));

//integrate body-parser with express
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

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
    connection.query('INSERT INTO friends (name, picture_link) VALUES (?,?)', [req.body.user_name, req.body.user_image_link], function (error, results, fields) {

        var userScores = req.body.responses.map((score, index) => {
            return [index + 1, results.insertId, score]
        })
        connection.query('INSERT INTO scores (question_id, friend_id, score) VALUES ?', [userScores], function (error, results, fields) {
            if (error) res.send(error)
            else {
                console.log(`Added questions scores `)
                res.send(req.body)
            }
        });
    })
})


app.listen(3001, function () {
    console.log('listening on 3001');
});






