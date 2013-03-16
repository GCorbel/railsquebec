class EventCreator
  attr_reader :user, :params
  def initialize(user, params)
    @user = user
    @params = params
  end

  def execute
    event = Event.new(params)
    event.user = user
    if event.valid?
      event.geocode
      event.save
    end
    event
  end
end
