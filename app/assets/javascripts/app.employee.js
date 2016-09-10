App.Employee = {

  add_employee_form: function() {
    $('.add_employee_form').form({
      on: 'blur',
      inline: true,
      fields: {
        email:{
          identifier  : "user[email]",
          rules:  [
            {
              type   : 'empty',
              prompt: 'Please enter your email'
            },
            {
              type   : 'email',
              optional   : true,
              prompt: "Please enter a valid e-mail"
            }
          ]
        },
        first_name:{
          identifier  : "user[first_name]",
          rules:  [
            {
              type   : 'empty',
              prompt: 'Please enter the employee first name'
            }
          ]
        },
        last_name:{
          identifier  : "user[last_name]",
          rules:  [
            {
              type   : 'empty',
              prompt: 'Please enter the employee last name'
            }
          ]
        },
        annual_salary:{
          identifier  : "user[annual_salary]",
          rules:  [
            {
              type   : 'empty',
              prompt: 'Please enter the employee annual salary'
            }
          ]
        },
        super_rate:{
          identifier  : "user[super_rate]",
          rules:  [
            {
              type   : 'empty',
              prompt: 'Please enter the employee super rake'
            }
          ]
        }
      }
    });
  }
};
