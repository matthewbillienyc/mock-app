
$(function() {
  // put a listener on your form on submit or on your submit button on click (give it some unique id)
  // preventDefault action
  // capture form params and send them with ajax call to your controller
  // on success, update the page with jquery somewhere showing the new user was posted successfully
  $('input[type="submit"]').click(function(event){
    event.preventDefault();
    var name= $('#user_name').val();
    $('#user_name').val('');
    $.ajax({
      url: '/users',
      method: 'POST',
      data: {name: name}
    })
  })

  $(document).ajaxComplete(function(event, request, options){
    $('ul').append('<li>'+ request.responseText +'</li>')
  })
});
