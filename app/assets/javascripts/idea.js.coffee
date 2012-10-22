$('document').ready ->
  $('.submit_idea').click ->
    element = $(@)
    element.attr('disabled', 'disabled')
    element.submit()
    element.parents('form').find("input[type='text']").val('')
    element.parents('form').find('textarea').val('')
    $('body').animate({scrollTop: 0})
    $('.js-newpost-form').hide()