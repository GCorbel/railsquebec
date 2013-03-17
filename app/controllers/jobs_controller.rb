class JobsController < InheritedResources::Base
  load_and_authorize_resource
  def create
    respond_with(JobCreator.new(current_user, params[:job]).execute)
  end
end
