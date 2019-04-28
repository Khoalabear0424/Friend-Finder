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
        var current_user_id = results.insertId;
        var userScores = req.body.responses.map((score, index) => {
            return [index + 1, results.insertId, score]
        })
        connection.query('INSERT INTO scores (question_id, friend_id, score) VALUES ?', [userScores], function (error, results, fields) {
            if (error) res.send(error)
            else {
                console.log(`Added questions scores `)
            }
        });

        connection.query('SELECT existing_name, SUM(score_difference) AS total_difference FROM (SELECT s1.question_id, f1.name AS existing_name, s1.score AS existing_score, n.name AS current_name, n.score AS current_score, ABS(s1.score-n.score) AS score_difference FROM scores s1 LEFT JOIN friends f1 ON s1.friend_id = f1.id LEFT JOIN (SELECT s2.question_id, f2.name, s2.score FROM scores s2 LEFT JOIN friends f2 ON s2.friend_id = f2.id WHERE s2.friend_id = ? ORDER BY s2.question_id ASC) n ON s1.question_id = n.question_id WHERE f1.id < ?) results GROUP BY existing_name ORDER BY total_difference ASC', [current_user_id, current_user_id], function (error, results, fields) {
            if (error) res.send(error)
            else {
                console.log('Success on finding total difference')
                res.send(results)
            }
        })
    })
})


app.listen(3001, function () {
    console.log('listening on 3001');
});






