

$.ajax({
    type: "GET",
    url: '/questions.json',
}).then((questions) => {
    console.log(questions)
    for (let i in questions) {
        var $title = $('<h3>')
        $title.text('Question ' + (questions[i].id))
        var $question = $('<p>');
        $question.text(questions[i].question);

        $('.questionsDisplay').append($title);
        $('.questionsDisplay').append($question);
        $('.questionsDisplay').append('<br>');
    }
});

