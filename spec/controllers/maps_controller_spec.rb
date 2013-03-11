require 'spec_helper'

describe MapsController do
  describe "GET 'users'" do
    it "return the users geocoded" do
      users = [double]
      User.stubs(:geocoded).returns(users)
      get 'users', format: :json
      assigns(:users).should eq users
    end
  end

  describe "GET 'jobs'" do
    it "return the jobs geocoded" do
      jobs = [double]
      Job.stubs(:geocoded).returns(jobs)
      get 'jobs', format: :json
      assigns(:jobs).should eq jobs
    end
  end

  describe "GET 'events'" do
    it "return the events geocoded" do
      events = [double]
      Event.stubs(:geocoded).returns(events)
      get 'events', format: :json
      assigns(:events).should eq events
    end
  end
end
