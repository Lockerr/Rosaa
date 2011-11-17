$(document).ready(function() {

  bind_sign_form();

  $('div#login_tab').click(function() {
    $(".js-regform").slideToggle(200);
    var xpos = 100;
    var ypos = 200;
    window.scrollTo(xpos, ypos);

  });






});

var bind_sign_form = function() {
  $('form#sign_in')
          .bind('ajax:success', function(e, data, status, xhr) {
            console.log(data);
            if (data.success) {
              $('.b-registration-users__amount').html(data.count);
              $('.b-registration-button__slogan').html('Вы присоединились');
              $('#user_nav').html(data.content);
              bind_sign_form();
              $('.js-regform').hide(200);


            } else {
              $(".js-regform").html(data.content);
              bind_sign_form();

            }

          });
};