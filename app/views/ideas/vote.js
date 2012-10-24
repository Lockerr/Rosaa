idea = $('div#idea_<%= @idea.id %>')
idea.find('.b-post-karma__amount').html('<%= @idea.likes.size - @idea.dislikes.size %>');
idea.find('.vote, .devote').css('background-color', '#c9c9c9')
idea.find('.b-post-karma__votes').prepend('<span>Ваш голос принят!</span><br/>')

