$(function(){
  $('#hidden-form').hide()
  $('button#edit').on("click", function(event){
    var url = window.location.href;
    var firstName = $('#fi_name').val()
    var lastName = $('#la_name').val()
    var user_id = /[/]\d+/g.exec(window.location.href)[0].slice(1);
    console.log("Edit ")

    $('#hidden-form').show()
    $('#name').hide()
    $('button#edit').css("display","none")
    $('.update-user').click(function(event){
      event.preventDefault()
      var newFirst = $('#user_first_name').val();
      var newLast = $('#user_last_name').val();
      $.ajax({
        url: '/users/' + user_id,
        method: 'PUT',
        data: {name: {first_name: newFirst, last_name: newLast}},
        success: function(event, request, options){
          $('#name').html("<strong>Name: </strong>"+event.first_name+" "+ event.last_name);
          $('#name').show()
          $('#hidden-form').hide()
          $('button#edit').css("display", "inline");

        }
      })
    })
  })
})
