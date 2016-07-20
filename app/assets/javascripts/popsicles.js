$(document).ready(function(){
  var ratingList = $('#rating_list')
  if(ratingList.length > 0){
    $('#popsicle-form-div').hide()
    $('#update_rating').show()
  }
  $("#rate_popsicle").submit(function(e){
    e.preventDefault();
    $('#update_rating').show()
    $.ajax({
      url: '/rate_popsicle',
      method: 'POST',
      data: $(this).serialize(),
      success: function(data){
        debugger;
        $("#popsicle-form-div").hide()
        $('#rating_list').append("<li class='list-group-item'>Rating: " + data.response.rating + "</li>")
        $('#rating_list').append("<li class='list-group-item'>Description: " + data.response.response_text + "</li>")
        $('#rating_list').append("<li class='list-group-item'>Status: " + data.status + "</li>")
      }
    })
  })

  $('#update_rating').click(function(e){
    e.preventDefault();
    $("#popsicle-form-div").show()
    $("#rating_list").empty();
    $(this).hide()
  });

  $('#display_notes').click(function(e){
    $("#display_notes_modal").foundation('reveal', 'open');
  });

});
