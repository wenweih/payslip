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
    })();
  },
  siteBootUp: function(){
    App.initUI.initHeadroom();
    App.initUI.initTimeago();
    App.initUI.initSemanticUITool();
    return;
  },
  sitePageInit: function(){
    App.initPage.session();
  },
  siteEvents: function(){
    App.bind.events();
  },
  turbolinksCache: function(){
    $(document).on('turbolinks:before-cache', function(){
      App.beforeCache.typedCache();
      App.beforeCache.formCache();
      App.beforeCache.flashCache();
    });
    return;
  },

  initUI: {
    initHeadroom: function(){
      $(".headeroom").headroom();
      $(document).on('scroll', function(){
        if ($(this).scrollTop() == 0){
          $('.headeroom').addClass('header-transparent');
        }else {
          $('.headeroom').removeClass('header-transparent');
          $(".headeroom").css({
            'background':'#fff',
            'border-bottom':'1px solid #DDD',
          });
          $(".headeroom").find("a").css({
            color: '#66676e'
          });
        }
      });
    },
    initTimeago: function(){
      $("time.timeago").timeago();
    },
    initSemanticUITool: function(){
      $('.ui.sidebar').sidebar('attach events', '.toc.item');
      $('.sub_menu').sticky({ context: '.post-index' });
    }
  },
  initPage: {
    session: function(){
      if($('.sessions.new').length > 0){
        App.Session.loginForm();
        App.Session.sayHello();
      }
    }
  },
  beforeCache:  {
    typedCache: function(){
      $('.typed-cursor').remove();
    },
    formCache: function(){
      $('.contact_form').form('clear');
    },
    flashCache: function(){
      $('.ns-box').remove();
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
    homeScrollNext: function(){
      $("html,body").animate({ scrollTop: $(window).height()}, 800);
    },
    homeContactMe: function(){
      $("html,body").animate({ scrollTop: $(document).height()*2}, 800);
    },
    messageForm:  function(){
      var $form = $('.contact_form');
      if($form.form('is valid')){
        $(this).addClass('disabled');
      }else{
        $form.submit(function(e){
          e.preventDefault();
          $('.contact_btn').text("Failed to send");
        });
      }
    }
  }
};

$(document).on('turbolinks:load', function(){
  App.init();
});
