#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require jquery.ui.effect-highlight.js
#= require ckeditor/init_ckeditor
#= require frontend_editor/frontend_editor
#= require minimalist_cms/minimalist_cms
#= require twitter/bootstrap
#= require jquery.turbolinks
#= require turbolinks
#= require_tree .
#= require markdown

$(document).ready ->
  initMarkdown()
