$(document).ready ->
  $('.toggle-login').click ->
    console.log 'click'
    form = $(".js-regform")
    form.find('.error_messages').html('Чтобы войти в систему, введите Ваш e-mail и пароль.')
    if form.css('display') == 'none'
      form.slideToggle(200)
  $('.toggle-register').click ->
    console.log 'clickaa'
    form = $(".js-regform")
    form.find('.error_messages').html('Чтобы вступить в наше сообществуо укажите Ваш e-mail и придумайте пароль.')
    if form.css('display') == 'none'
      form.slideToggle(200)
    
