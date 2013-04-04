require 'spec_helper'

describe JobsController do
  describe "POST 'create'" do
    it "create a job" do
      params = {}
      job_creator = stub
      user = build_stubbed(:user)
      job = build_stubbed(:job)

      sign_in user

      JobCreator.should_receive(:new).with(user, params).and_return(job_creator)
      job_creator.should_receive(:execute).and_return(job)
      put 'create', job: params
    end
  end
end
