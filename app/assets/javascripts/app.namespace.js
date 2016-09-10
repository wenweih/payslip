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
  },
  add_employee_to_department_form: function(){
    $('.add_to_department_form').form({
      on: 'blur',
      inline: true,
      fields: {
        employee:{
          identifier  : "employee",
          rules:  [
            {
              type   : 'empty',
              prompt: 'Please add at least one employee'
            }
          ]
        },
        department:{
          identifier  : "department",
          rules:  [
            {
              type   : 'empty',
              prompt: 'Please add at least one employee'
            }
          ]
        }
      }
    });
  }
};
