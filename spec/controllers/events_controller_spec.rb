require 'spec_helper'

describe EventsController do
  describe "POST 'create'" do
    it "create a job" do
      params = {}
      event_creator = stub
      user = build_stubbed(:user)
      event = build_stubbed(:event)

      sign_in user

      EventCreator.should_receive(:new).with(user, params).and_return(event_creator)
      event_creator.should_receive(:execute).and_return(event)
      put 'create', event: params
    end
  end
end
