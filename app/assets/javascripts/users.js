
$(function() {
  // put a listener on your form on submit or on your submit button on click (give it some unique id)
  // preventDefault action
  // capture form params and send them with ajax call to your controller
  // on success, update the page with jquery somewhere showing the new user was posted successfully
  $('.create-user').click(function(event){
    event.preventDefault();
    debugger
    var name= $('#user_name').val();
    $('#user_name').val('');
    var lastEntry = $('li:last').html();
    var lastID = /[/]\d+/g.exec(lastEntry)[0].slice(1);
    var currentID = parseInt(lastID) + 1;
    $.ajax({
      url: '/users',
      method: 'POST',
      data: {name: name},
      success: (function(event, request, options){
        debugger;
        $('ul').append('<li><a href="/users/'+ currentID + '">'+ event.responseText +'</a></li>')
      })
    })
  })


});
