class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Event do |event|
      event.user == user
    end
  end
end
