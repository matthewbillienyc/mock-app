$(function(){
  $('#hidden-form').hide()
  $('button#edit').on("click", function(event){
    var url = window.location.href;
    var case_id = /[/]\d+/g.exec(window.location.href)[0].slice(1);

    $('#hidden-form').show()
    $('#description').hide()
    $('button#edit').css("display","none")
    $('.update-case').click(function(event){
      event.preventDefault()
      var desc = $('input#case_description').val()
      $.ajax({
        url: '/cases/' + case_id,
        method: 'PUT',
        data: {description: desc},
        success: function(event, request, options){
          debugger;
          $('#description').html("Description"+event.new_desc);
          $('#description').show()
          $('#hidden-form').hide()
          $('button#edit').css("display", "inline");
        }
      })
    })
  })
})
