class ActionDispatch::Routing::RouteSet
  def url_for_with_locale_fix(options)
    options[:locale] = :en
    url_for_without_locale_fix(options)
  end

  alias_method_chain :url_for, :locale_fix
end
