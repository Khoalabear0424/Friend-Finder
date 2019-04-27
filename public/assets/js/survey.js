
$.ajax({
    type: "GET",
    url: '/questions.json',
}).then((questions) => {
    console.log(questions)
    for (let i in questions) {
        console.log(questions[i].question)
        var $title = $('<h3>')
        $title.text('Question ' + (questions[i].id))

        var $questionStatement = $('<p>');
        $questionStatement.text(questions[i].question);

        var $label = $('<label>');
        var $select = $('<select>')

        $label.attr('for', 'sel1');
        $label.text('Select an Option:')
        $select.attr('class', 'form-control')
        $select.attr('id', questions[i].id)

        for (let i = 1; i <= 5; i++) {
            var $option = $('<option>');
            $option.text(i);
            $select.append($option);
        }

        var $questionDropDown = $('<form-group>');
        $questionDropDown.append($label, $select)

        $('.questionsDisplay').append($title, $questionStatement, $questionDropDown);
        $('.questionsDisplay').append('<br>');
    }
});