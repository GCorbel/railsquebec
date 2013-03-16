class UsersController < InheritedResources::Base
  def create
    respond_with(UserCreator.new(params[:user]).execute)
  end
end
