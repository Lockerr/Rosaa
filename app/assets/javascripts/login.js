$(document).ready(function() {
  bind_sign_form();


  $('div#register_tab').click(function() {
    $(".js-regform").show(200);
    $('.rc10.inlineBlock.b-regform__button#js_login_form').attr('value', 'ПРИСОЕДИНИТЬСЯ');
    $('body').scrollTop(250);
    $('#b-regform__email').focus();

  });

  $('div#login_tab').click(function() {
    $(".js-regform").show(200);
    $('.rc10.inlineBlock.b-regform__button#js_login_form').attr('value', 'ВОЙТИ');
    $('body').scrollTop(250);
    $('#b-regform__email').focus();

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
          $('.error_messages').html('Вам отправлено письмо с инструкцие по подтверждению регистрация');
          bind_sign_form();

        }

      });
};