$(document).ready(function() {
  $('.create-user').click(function(event){
    event.preventDefault();
    debugger;
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
        var firstName= JSON.parse(event.responseText).first_name
        var lastName= JSON.parse(event.responseText).last_name
        $('ul').append('<li><a href="/users/'+ currentID + '">'+ firstName +" "+ lastName +'</a></li>')
      }
    })
  })

  $("#new_user").on('submit', function(e) {
    if (!($(this).valid())) {
      $('.user_info').append('Invalid Options');
    } else {
      e.preventDefault();
      var form = $(this).serialize();
      $.ajax({
        url: '/users',
        method: 'POST',
        data: form,
        success: function(data, request, options){
          $('.user_info').append("You've registered an account for email address: " + data.email)
        }
      })
    }
  });
});
