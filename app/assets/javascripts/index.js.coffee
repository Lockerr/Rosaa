show_errors = (msg) ->
  
  result = ''
  
  if messages = JSON.parse(msg.responseText).errors

    for error in messages
      # console.log 'many messages'
      result += "<p>#{error} - #{messages[error]}</p>"
  else if message = JSON.parse(msg.responseText).error

    # console.log 'one_message'
    result = message

  result

$ ->
	$('#js_register').click ->
    $.ajax
      url: 'users/sign_in.json',
      type: 'POST',
      data: $('#sign_in').serialize()
      beforeSend: ->
        $('.error_messages').html('Пожалуйста подождите...')
      success: (msg) ->
        window.msg = msg
        $('.b-registration').remove()
        $('.js-regform').remove()
        $('#user_nav').empty()
        $('#user_nav').append "<div id='user_nav'>Вы вошли как #{msg.email}. Не вы? <a href='/users/sign_out' data-method='delete' rel='nofollow'>Выйти</a></div>"
      error: (data) ->
        if data.status == 401
          # console.log 401
          $.ajax
            url: 'users.json'
            type: 'POST'
            data: $('#sign_in').serialize()
            success: (msg, msg2, msg3) ->
              # console.log msg
              # console.log msg2
              # console.log msg3
              if msg.status = 201
                window.msg = msg
                $('.b-registration').remove()
                $('.js-regform').remove()
                $('#user_nav').empty()
                $('#user_nav').append "<div id='user_nav'>Вы вошли как #{msg.email}. Не вы? <a href='/users/sign_out' data-method='delete' rel='nofollow'>Выйти</a></div>"
            error: (msg, msg2, msg3, msg4) ->
              # console.log 'error'
              # console.log msg
              # console.log "-- #{msg2}"
              # console.log "--- #{msg3}"
              # console.log "---- #{msg4}"
              window.msg = msg
              if msg.status == 422
                # console.log "422 in second request"
                $('.error_messages').html show_errors(data)
        if data.status == 422
          # console.log 422
          # console.log data
          $('.error_messages').html show_errors(data)
          