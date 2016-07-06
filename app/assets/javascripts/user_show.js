$(function(){
  $('button#edit').on("click", function(event){
    var url = window.location.href;
    var firstName = $('#first_name').val()
    var lastName = $('#last_name').val()
    var user_id = /[/]\d+/g.exec(window.location.href)[0].slice(1);
    console.log("Edit ")

    $('#name').html('<strong>First Name:</strong><input type="text" id="first_name" value="'+ firstName +'"> <strong>Last Name:</strong><input type="text" id="last_name" value="'+ lastName +'">');
    $('button#edit').css("display","none")
    $('#container').append('<button id="update">Update This User</button>');
    $('#container button#update').click(function(){
      var newFirst = $('input#first_name').val();
      var newLast = $('input#last_name').val();
      $.ajax({
        url: '/users/' + user_id,
        method: 'PUT',
        data: {name: {first_name: newFirst, last_name: newLast}},
        success: function(event, request, options){
          $('#name').html("<strong>Name: </strong>"+event.first_name+" "+ event.last_name);
          $('button#update').css("display", "none")
          $('button#edit').css("display", "inline");
        }
      })
    })
  })
})
