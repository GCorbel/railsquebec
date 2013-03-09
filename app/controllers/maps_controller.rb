class MapsController < ApplicationController
  def index
  end

  def users
    users = User.select('id, username,latitude,longitude').geocoded.map! do|o|
      link = user_url(o["id"])
      title = o["username"]
      icon = view_context.image_path('maps/users.png')
      o.attributes.merge(link: link, title: title, icon: icon)
    end

    respond_to do |f|
      f.json do
        render json: users
      end
    end
  end
end