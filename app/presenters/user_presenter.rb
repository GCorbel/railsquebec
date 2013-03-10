class UserPresenter
  def self.latest(size)
    User.order("created_at desc").limit(size)
  end
end
