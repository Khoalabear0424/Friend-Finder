
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

        $label.attr('for', 'sel' + questions[i].id);
        $label.text('Select an Option:')
        $select.attr('class', 'form-control')
        $select.attr('id', 'questionID' + questions[i].id)

        var allOptions = ["", 1 + ' Strongly Disagrees', 2, 3, 4, 5 + ' Strongly Agree']

        for (let i in allOptions) {
            var $option = $('<option>');
            $option.attr('value', i)
            $option.text(allOptions[i]);
            $select.append($option);
        }

        var $questionDropDown = $('<form-group>');
        $questionDropDown.append($label, $select)

        $('.questionsDisplay').append($title, $questionStatement, $questionDropDown);
        $('.questionsDisplay').append('<br>');
    }
});


$('#user_data').submit(function (e) {
    var responses = [];
    for (let i = 0; i < $('select').length; i++) {
        responses.push($('select').eq(i).val())
    }
    console.log(responses);
    e.preventDefault();
    $.ajax({
        url: '/find-friend-match',
        method: 'POST',
        data: {
            user_name: $("#user_name").val(),
            user_image_link: $("#user_image_link").val(),
            // responses: responses,
        }
    }).then(function (response) {
        console.log(response);
    });
})