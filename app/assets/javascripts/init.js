//= require headroom
//= require jQuery.headroom
//= require semantic
//= require jquery.timeago
//= require jquery.timeago.zh-CN
//= require modernizr.custom
//= require notification
window.App || (window.App = {});
App = {
  init: function(){
    (function(){
      App.siteBootUp();
      App.turbolinksCache();
      App.sitePageInit();
      App.siteEvents();
      App.commonInit();
    })();
  },
  siteBootUp: function(){
    App.initUI.initHeadroom();
    App.initUI.initTimeago();
    App.initUI.initSemanticUITool();
    App.initUI.initJsroute();
    App.intiCommon
    return;
  },
  commonInit: function(){
    App.Namespace.add_department_form();
    App.Employee.add_employee_form();
  },
  sitePageInit: function(){
    App.initPage.session();
    App.initPage.user();
  },
  siteEvents: function(){
    App.bind.events();
  },
  turbolinksCache: function(){
    $(document).on('turbolinks:before-cache', function(){
      App.beforeCache.formCache();
    });
    return;
  },

  initUI: {
    initHeadroom: function(){
      $(".headeroom").headroom();
    },
    initTimeago: function(){
      $("time.timeago").timeago();
    },
    initJsroute: function(){
      jQuery.extend(window, Routes);
    },
    initSemanticUITool: function(){
      $('.signed_in_dpd').dropdown({  action: 'hide'  });
      $('.namespace_selector').dropdown({allowAdditions: true});
      $('.add_employee_dropdpwn').dropdown({
        fields: {

        },
        apiSettings:  {
          url: Routes.query_user_path(),
          cache: false
        },
        saveRemoteData: false,

      });
      $('.change_namespace').dropdown();
      $('.ui.accordion').accordion({
        selector: {
          trigger: '.title .title_desc'
        }
      });
    }
  },
  initPage: {
    session: function(){
      if($('.sessions.new').length > 0){
        App.Session.loginForm();
      }
      if($('.namespace.index').length > 0){
        $('.ui.accordion').children().slice(0,2).addClass('active')
      }
      if($('.employee.index').length >0){
        $('.change_namespace').change(function(){
          $(this).closest('form').trigger('submit');
        });
      }
    },
    user: function(){
      if($('.users.new').length >0){
        App.User.signupForm();
      }
    }
  },
  beforeCache:  {
    formCache: function(){
      $('.ui.form').form('clear');
    }
  },
  bind: {
    events: function(){
      $(document).on('click',"*[data-behavior]", function(e){
        var behavior = $(e.target).attr("data-behavior");
        if ( behavior !== undefined ) {
          eval("App.events." + behavior + "();");
        }
      })
    }
  },
  events: {
    adddepartment: function(){
      $('.add_department_modal').modal({
        onApprove : function() {
          if($('.add_department_form').form('is valid')){
            $('.add_department_form').form('submit');
          }else{
            return false;
          }

        }
      }).modal('show');
    },
    addemployee: function(){
      $('.add_employee_modal').modal({
        onApprove : function() {
          if($('.add_employee_form').form('is valid')){
            $('.add_employee_form').form('submit');
          }else{
            console.log("false");
            return false;
          }

        }
      }).modal('show');
    },
    calculate: function(){
      $('.calculate').modal('show');
    }
  }
};

$(document).on('turbolinks:load', function(){
  // Here we go
  App.init();
});
