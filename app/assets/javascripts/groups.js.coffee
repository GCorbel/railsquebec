$(document).ready ->
  if $('#forum_embed').length
    src = 'https://groups.google.com/forum/embed/?place=forum/rubyquebec'
    + '&showsearch=true&showpopout=true&showtabs=false'
    + '&parenturl=' + encodeURIComponent(window.location.href)
    $('#forum_embed').attr('src', src)
