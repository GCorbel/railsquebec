class EventPresenter
  def self.latest(size)
    Event.order("date desc").limit(size)
  end
end
