App.Session = {
  loginForm: function() {
    $('.user_login').form({
      on: 'blur',
      inline : true,
      fields: {
        email:{
          identifier  : "session[email]",
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
        password: {
          identifier: 'session[password]',
          rules:  [
            {
              type: 'minLength[6]',
              prompt : '密码必须为六位数以上'
            }
          ]
        }
      }
    });

  },
  sayHello: function(){
    setTimeout(function(){
      $(document).notification("<div class='ns-thumb'><img src='/user.jpg'/></div><div class='ns-content'><p><a href='#'>Zoe Moulder</a> accepted your invitation.</p></div>");
    }, 3200);
  }
};
