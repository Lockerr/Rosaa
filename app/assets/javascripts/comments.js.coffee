# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
make_bindings = ->
  $(".show_comments")
    .bind "ajax:success", (e, data, status, xhr) ->
      alert('bind')
      $("#content").html data

      $("form#new_comment")
        .bind "ajax:success", (e, data, status, xhr) ->
          $("#comments").html data

        .bind "ajax:error", (evt, xhr, status, error) ->
          alert error

