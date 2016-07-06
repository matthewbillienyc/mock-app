$(function(){
  $('button#edit').on("click", function(event){
    var url = window.location.href;
    var currentName = $('#name').text();
    var user_id = /[/]\d+/g.exec(window.location.href)[0].slice(1);
    console.log("Edit ")

    $('#name').html('<input type="text" id="name" value="'+ currentName +'">');
    $('button#edit').css("display","none")
    $('#container').append('<button id="update">Update This User</button>');
    $('#container button#update').click(function(){
      var newName = $('input#name').val();
      $.ajax({
        url: '/users/' + user_id,
        method: 'PUT',
        data: {name: newName},
        success: function(event, request, options){
          $('#name').html(newName);
          $('button#update').css("display", "none")
          $('button#edit').css("display", "inline");
        }
      })
    })

  })
})
