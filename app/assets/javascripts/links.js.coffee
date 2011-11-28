$(document).ready ->
  $('.b-toptext-text').hide()
  $('.b-toptext-text#fuel').show()
  $(".b-toptext-lead__link").click ->
    $('.b-toptext-text').hide()
    $('.b-toptext-text#' + $(this).attr('id')).show()
    $(".b-toptext-lead__link").removeClass('current')
    $(this).addClass('current')
