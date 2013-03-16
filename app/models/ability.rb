class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Event do |event|
      event.user == user
    end

    can :manage, Job do |job|
      job.user == user
    end
  end
end
