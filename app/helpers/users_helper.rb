module UsersHelper
  def email_for(user)
    if user.email_visible?
      content_tag(:p) do
        link_to user.email, "mailto:#{user.email}"
      end
    end
  end

  def twitter_for(user)
    if user.twitter
      content_tag(:p) do
        link_to user.twitter, "http://twitter.com/#{user.twitter}"
      end
    end
  end

  def github_for(user)
    if user.github
      content_tag(:p) do
        link_to user.github, "https://github.com/#{user.github}"
      end
    end
  end

  def website_for(user)
    if user.website
      content_tag(:p) do
        link_to user.website, user.website
      end
    end
  end
end
