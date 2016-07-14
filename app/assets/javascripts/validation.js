$(document).ready(function() {

  $("#new_user").validate({
    showErrors: function(errorMap, errorList) {
      this.defaultShowErrors();
    },
    rules: {
      "user[email]": {
        required: true
      },
      "user[first_name]": {
        maxlength: 10
      },
      "user[last_name]": {
        required: $("#user_first_name").val().length < 5
      }
    },
    messages: {
      "user[email]": {
        required: "This is a required field."
      },
      "user[first_name]": {
        maxlength: "Your name is way too effin long!"
      },
      "user[last_name]": {
        required: "Last name required if your first name is less than 5 characters."
      }
    },
    onfocusout: function(element) {
      this.element(element);
    }
  })
});