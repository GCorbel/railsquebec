json.array!(@users) do |user|
  json.(user, :latitude, :longitude)
  json.link user_path(user)
  json.title user.username
  json.icon image_path('maps/users.png')
end
