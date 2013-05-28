#encoding=utf-8
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

  def excerpt(text)
    raw(truncate(sanitize(text), length: 200))
  end

  def markdown(code)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       autolink: true,
                                       no_intra_emphasis: true,
                                       fenced_code_blocks: true)
    markdown.render(code)
  end

  def link_to_locales
    text = I18n.locale == :en ? "Version Française" : "English Version"
    locale = I18n.locale == :en ? 'fr' : 'en'
    link_to raw("<i class='icon-flag'></i> #{text}"), "/#{locale}/"
  end

  def browser_title(title)
    content_for(:title) { title }
  end
end
