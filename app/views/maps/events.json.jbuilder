json.array!(@events) do |event|
  json.(event, :latitude, :longitude)
  json.link event_path(event)
  json.title event.title
  json.icon image_path('maps/events.png')
end
