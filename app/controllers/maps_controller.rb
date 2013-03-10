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

  def jobs
    jobs = Job.select('id, post_name,latitude,longitude').geocoded.map! do|o|
      link = user_url(o["id"])
      title = o["post_name"]
      icon = view_context.image_path('maps/jobs.png')
      o.attributes.merge(link: link, title: title, icon: icon)
    end

    respond_to do |f|
      f.json do
        render json: jobs
      end
    end
  end

  def events
    events = Event.select('id, title,latitude,longitude').geocoded.map! do|o|
      link = user_url(o["id"])
      title = o["title"]
      icon = view_context.image_path('maps/events.png')
      o.attributes.merge(link: link, title: title, icon: icon)
    end

    respond_to do |f|
      f.json do
        render json: events
      end
    end
  end
end
