class MapsController < ApplicationController
  def index
  end

  def users
    @users = User.geocoded
  end

  def jobs
    @jobs = Job.geocoded
  end

  def events
    @events = Event.geocoded
  end
end
