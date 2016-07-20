$(function() {
  $("#note_form").submit(function(e){
    e.preventDefault();
    if($(this).valid()) {
      $.ajax({
        url: '/notes',
        method: 'post', 
        data: $(this).serialize(),
        success: function(response) {
          $(".notes-group .list-group").append("<li class='list-group-item'>" + response.text + " - Importance: " + response.Importance + "</li>")
          $("#note_importance").val('');
          $("#note_text").val('');
        }
      })  
    } else {
      alert('Invalid Submission');
    }
  })
});
