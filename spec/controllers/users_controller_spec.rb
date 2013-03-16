require 'spec_helper'

describe UsersController do
  describe "POST 'create'" do
    it "create a user" do
      params = {}
      user_creator = stub
      user = build_stubbed(:user)

      UserCreator.should_receive(:new).with(params).and_return(user_creator)
      user_creator.should_receive(:execute).and_return(user)
      put 'create', user: params
    end
  end
end
