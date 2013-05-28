#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require maps
#= require groups
#= require twitter/bootstrap
#= require jquery.turbolinks
#= require turbolinks
#= require markdown

$(document).ready ->
  initMarkdown()
  initMap()
  initDiscussionGroup()
  prefixAjax()

@prefixAjax = ->
  $.ajaxSetup
    beforeSend: (xhr) ->
      prefix = ''
      if @url[0..5] == '/pages'
        prefix = '/page'

      @url = '/' + window.locale + prefix + @url
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
