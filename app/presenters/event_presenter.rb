class EventPresenter
  def self.latest(size)
    Event.limit(size)
  end
end
