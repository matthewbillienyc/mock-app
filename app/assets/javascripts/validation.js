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
      },
      "user[password]":{
        required: true
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
      },
      "user[password]":{
        required: "This is a required field."
      }
    },
    onfocusout: function(element) {
      this.element(element);
    }
  })

  $("#note_form").validate({
    showErrors: function(errorMap, errorList){
      this.defaultShowErrors();
    },
    rules: {
      "note[importance]": {
        required: true
      },
      "note[text]": {
        required: true
      }
    },
    messages: {
      "note[importance]": {
        required: "This is a required field."
      },
      "note[text]": {
        required: "This is a required field."
      },
      onfocusout: function(element) {
        this.element(element);
      }
    }
  })
});
