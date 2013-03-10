json.array!(@events) do |event|
  json.link event_path(event)
  json.title event.title
  json.icon image_path('maps/events.png')
  json.latitude event.latitude
  json.longitude event.longitude
end
