# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $repos = $('#repos')
  $.ajax({
    method: 'GET',
    url:    $repos.attr('data-url')
  })
  .then ( data ) ->
    data.forEach (repo) ->
      elem = $('<li>');
      elem.append($('<a>').attr(href: repo.html_url).text(repo.full_name))
      $repos.append(elem)
  , ( xhr ) ->
    console.warn(xhr)

