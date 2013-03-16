class EventsController < InheritedResources::Base
  def create
    respond_with(EventCreator.new(current_user, params[:event]).execute)
  end
end
