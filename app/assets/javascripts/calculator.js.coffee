# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

region_combo = []
region_combo_new = []
current_region = 0
current = []

$ ->
  if $('input.region_combo').val() != ''
    region_combo = $('.region_collection .region')
    $.each region_combo, (index, value) ->
      if region_combo[index].innerHTML.match($('input.region_combo').val())
        current.push region_combo[index]
        if current.length = 1
          if parseInt($(this).attr('id'))
              current_region = parseInt($(this).attr('id'))
              data = 'region=' + $(this).attr('id') + '&power=' + $('input.power').attr('value')
              $.ajax(
                url: 'calculator/show',
                method: 'get'
                data: data
              ).done (msg) ->
                $('.b-calculator-nalog__amount').html(msg)

  $('input.region_combo').observe_field 0.5,->
    region_combo_new = []
    $.each region_combo, (index, value) ->
      if region_combo[index].innerHTML.match($('input.region_combo').val())
        first = $.trim(region_combo[index].innerText);
        second = $('input.region_combo').val()
        if (first == $.trim($('input.region_combo').val()))
          $('.region_collection').hide()
        else
          if $('input.region_combo').val() != ''
            $('.region_collection').show()
        region_combo_new.push region_combo[index]
        $('.region_collection').html(region_combo_new)
        $('.region').click ->
          $('input.region_combo').val($(this).attr('name'))
          console.log($(this).select('div'))
          $('.region_collection').hide()
          if parseInt($(this).attr('id'))
            current_region = parseInt($(this).attr('id'))
            data = 'region=' + $(this).attr('id') + '&power=' + $('input.power').attr('value')
            $.ajax(
              url: 'calculator/show',
              method: 'get'
              data: data
            ).done (msg) ->
              $('.b-calculator-nalog__amount').html(msg)

$ ->
  $('select#calculator_region').observe_field 0.5,->
      $('input.region_combo').attr('value', $('select#calculator_region option:selected').html())

$ ->
  $('input.power').observe_field 0.5, ->
    if $('input.region_combo').val() != ''
      if parseInt($('input.power').attr('value'))
        data = 'region=' + current_region + '&power=' + $('input.power').attr('value')
        $.ajax(
          url: 'calculator/show',
          method: 'get'
          data: data
        ).done (msg) ->
          $('.b-calculator-nalog__amount').html(msg)



$ ->
  region_combo = $('.region_collection .region')

$ ->
  $('.cross').click ->
    $('input.region_combo').val('')
    $('region_collection').hide()



