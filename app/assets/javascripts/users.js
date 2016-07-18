$(function() {
  // put a listener on your form on submit or on your submit button on click (give it some unique id)
  // preventDefault action
  // capture form params and send them with ajax call to your controller
  // on success, update the page with jquery somewhere showing the new user was posted successfully
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
      success: function(event, request, options){
        $('ul').append('<li><a href="/users/'+ currentID + '">'+ event.first_name +" "+ event.last_name+'</a></li>')
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

  $("div.revealModal#myModal").close();
  $('#notes > a').click(function(){
    $("div.revealModal#myModal").open();
  })
});
