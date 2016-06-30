
$(function() {
  // put a listener on your form on submit or on your submit button on click (give it some unique id)
  // preventDefault action
  // capture form params and send them with ajax call to your controller
  // on success, update the page with jquery somewhere showing the new user was posted successfully
  $('input[type="submit"]').click(function(event){
    event.preventDefault();
    var name= $('#user_name').val();
    $('#user_name').val('');
    var lastEntry = $('li:last').html();
    var lastID = /\d\d/.exec(lastEntry);
    var currentID = parseInt(lastID) + 1;
    $.ajax({
      url: '/users',
      method: 'POST',
      data: {name: name},
      complete: (function(event, request, options){
        $('ul').append('<li><a href="/users/'+ currentID + '">'+ event.responseText +'</a></li>')
      })
    })
  })

  $('button#edit').click(function(event){
    event.preventDefault();
    event.stopImmediatePropagation();
    console.log('edit button clicked')
    var url = window.location.href;
    var currentName = $('#name').text();
    var user_id = /[/]\d+/g.exec(window.location.href)[0].slice(1);

    $('#name').html('<input type="text" id="name" value="'+ currentName +'">');
    $('#container').html('<button id="update">Update This User</button>');
    $('button#update').click(function(){
      var newName = $('input#name').val();
      $.ajax({
        url: '/users/' + user_id,
        method: 'PUT',
        data: {name: newName},
        complete: (function(event, request, options){
          $('#name').html(newName);
          $('#container').html('<button id="edit">Edit This User</button>');
        })
      })
    })

  })

  // $(document).ajaxComplete(function(event, request, options){
  //   $('ul').append('<li>'+ request.responseText +'</li>')
  // })
});
