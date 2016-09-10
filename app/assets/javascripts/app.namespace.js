App.Namespace = {

  add_department_form: function() {
    $('.add_department_form').form({
      on: 'blur',
      inline: true,
      fields: {
        namespace:{
          identifier  : "namespace",
          rules:  [
            {
              type   : 'empty',
              prompt: 'Please add at least one department'
            }
          ]
        }
      }
    });
  }
};
