$(document).ready(function() {
  $('.create-user').click(function(event){
    event.preventDefault();

    var first_name= $('#user_first_name').val();
    var last_name= $('#user_last_name').val();
    $('#user_first_name').val('');
    $('#user_last_name').val("");
    var lastEntry = $('li:last').html();
    var lastID = /[/]\d+/g.exec(lastEntry)[0].slice(1);
    var currentID = parseInt(lastID) + 1;
    $.ajax({
      url: '/users',
      method: 'POST',
      data: {user: {first_name: first_name, last_name: last_name}},
      complete: function(event, request, options){
        $('ul').append('<li><a href="/users/'+ currentID + '">'+ event.first_name +" "+ event.last_name+'</a></li>')
      }
    })
  })
});
