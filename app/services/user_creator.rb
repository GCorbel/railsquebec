class UserCreator
  attr_reader :params
  def initialize(params)
    @params = params
  end

  def execute
    user = User.new(params)
    if user.valid?
      user.geocode
      user.save
    end
    user
  end
end
