// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

(function( $ ){

  jQuery.fn.observe_field = function(frequency, callback) {

    frequency = frequency * 1000; // translate to milliseconds

    return this.each(function(){
      var $this = $(this);
      var prev = $this.val();

      var check = function() {
        var val = $this.val();
        if(prev != val){
          prev = val;
          $this.map(callback); // invokes the callback on $this
        }
      };

      var reset = function() {
        if(ti){
          clearInterval(ti);
          ti = setInterval(check, frequency);
        }
      };

      check();
      var ti = setInterval(check, frequency); // invoke check periodically

      // reset counter after user interaction
      $this.bind('keyup', reset); //mousemove is for selects
    });

  };

})( jQuery );

  var make_bindings = function() {
    $(".pagination a").attr("data-remote", "true");
    $("form#new_comment").attr("data-remote", "true");
    $('.to_login').click(function() {
      $(".js-regform").show(200);
      window.scrollTo(100, 200);
      $('.rc10.inlineBlock.b-regform__button#js_login_form').attr('value', 'ВОЙТИ');
    });

  };

  var sign_idea = function() {
    $(".js-registration-button, .js-regform__close").click(function() {
      $(".js-regform").slideToggle(200);
    });
    $(".js-newpost-button, .js-newpost__close").click(function() {
      $(".js-newpost-form").slideToggle(200);
    });
  };

  var markup = function() {
    $(".js-post").mouseenter(function() {
      $this = $(this);
      if (!$this.hasClass("b-post_state_active")) {
        $this.addClass("b-post_state_hover");
        $this.next().next().addClass("b-post_state_hovernext");
      }
    });

    $(".js-post").mouseleave(function() {
      $this = $(this);
      $this.removeClass("b-post_state_hover");
      $this.next().next().removeClass("b-post_state_hovernext");
    });
    $(".js-post-header__link").click(function() {
      $post = $(this).parent().parent().parent();
      toggleComments($post);
    });

    $(".js-comment__hidecomment").click(function() {
      $post = $(this).parent().parent().parent().prev();
      $post.next().next().addClass("b-post_state_hovernext");
      toggleComments($post);
    });

    $(".js-post__comment-link").click(function() {
      $post = $(this).parent().parent().parent().parent();
      toggleComments($post);
    });


    function toggleComments($post) {
      $post.next().next().toggleClass("b-post_state_hovernext");
      $post.toggleClass("b-post_state_active").find(".b-post__author").slideToggle(200);
      $post.find(".b-bigblockcorner-container").slideToggle(50);
      $post.next().slideToggle(200);
    }


    $(".b-");


  };