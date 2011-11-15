$(document).ready(function() {

  $('form#sign_in')
          .bind('ajax:success', function(e, data, status, xhr) {
            console.log(data);
            if (data.success) {
              var amount = $('.b-registration-users__amount')[0].innerHTML
              amount = parseInt(amount) + 1
              $('.b-registration-users__amount').html(data.count);
              $('.b-registration-button__slogan').html('Вы присоединились');
              $('#user_nav').html(data.content);
              $(".js-regform").slideToggle(200);
              $(".js-regform").html('');

            } else {
              $(".js-regform").prepend(data.content);
            }

          });

  $('div#login_tab').click(function() {
    $(".js-regform").slideToggle(200);
    var xpos = 100;
    var ypos = 200;
    window.scrollTo(xpos, ypos);

  });

  $('.pagination a').attr('data-remote', 'true');




});
