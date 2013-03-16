require 'spec_helper'

describe JobCreator do
  let(:job) { build_stubbed(:job) }
  let(:user) { build_stubbed(:user) }
  let(:params) { job.attributes }

  before do
    job.stub(:save)
    Job.stub(:new).and_return(job)
  end

  describe :execute do
    it "assign the user to the job" do
      JobCreator.new(user, params).execute
      expect(job.user).to eq user
    end

    context "when the job is valid" do
      before { job.stub(:valid?).and_return(true) }

      it "save the job" do
        job.should_receive(:save)
        JobCreator.new(user, params).execute
      end

      it "geolocalize the job" do
        job.should_receive(:geocode)
        JobCreator.new(user, params).execute
      end
    end
  end
end
