$('div#idea_<%= @idea.id %>.b-post-karma__amount').html(<%= @idea.likes.size - @idea.dislikes.size %>);

