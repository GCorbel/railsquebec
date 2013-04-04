class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user
      if user.admin?
        can :manage, :all
      else
        can :create, :all
        can :manage, Event do |event|
          event.user == user
        end

        can :manage, Job do |job|
          job.user == user
        end
      end
    end
  end
end
