class EventsController < InheritedResources::Base
  load_and_authorize_resource
  def create
    respond_with(EventCreator.new(current_user, params[:event]).execute)
  end
end
