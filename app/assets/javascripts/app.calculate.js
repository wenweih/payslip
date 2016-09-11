App.Calculate = {
  calculate_form: function() {
    $('.calculate_form').form({
      on: 'blur',
      fields: {
        employee: {
          identifier  : "employee",
          rules:  [
            {
              type   : 'empty',
              prompt: 'you must select an employee'
            }
          ]
        },
        start: {
          identifier: 'start',
          rules:  [
            {
              type: 'empty',
              prompt : 'you must select a start time'
            }
          ]
        },
        end: {
          identifier: 'end',
          rules:  [
            {
              type: 'empty',
              prompt : 'you must select a end time'
            }
          ]
        }
      }
    });

  }
};
