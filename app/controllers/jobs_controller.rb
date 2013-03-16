class JobsController < InheritedResources::Base
  def create
    respond_with(JobCreator.new(current_user, params[:job]).execute)
  end
end
