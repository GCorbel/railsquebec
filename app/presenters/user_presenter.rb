class UserPresenter
  def self.latest(size)
    User.limit(size)
  end
end
