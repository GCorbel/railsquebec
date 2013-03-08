module ApplicationHelper
  def alert_box(class_name, message)
    if message.present?
      message_tag = content_tag(:div, message)
      button_tag = content_tag(:button, "x", class: "close", data: { dismiss: "alert" })
      content_tag :div, button_tag + message_tag , class: "alert alert-#{class_name}"
    end
  end

  def avatar_url(user, size=100)
    default_url = "http://#{request.host}:#{request.port}/assets/guest.png"
    return default_url if user.nil? || !Rails.env.production?
    avatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{avatar_id}.png" \
      "?s=#{size}&d=#{CGI.escape(default_url)}"
  end

  def image_for(user)
    image_tag(avatar_url(user, 76), class: 'avatar')
  end
end
