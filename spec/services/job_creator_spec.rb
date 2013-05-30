require 'spec_helper'

describe JobCreator do
  let(:job) { build_stubbed(:job) }
  let(:user) { build_stubbed(:user) }
  let(:params) { job.attributes }

  subject { job }

  before do
    job.stub(:save)
    job.stub(:geocode)
    Job.stub(:new).and_return(job)
  end

  describe :execute do
    before { JobCreator.new(user, params).execute }

    its(:user) { should eq user }

    context "when the job is valid" do
      before { job.stub(:valid?).and_return(true) }

      it { should have_received(:save) }
      it { should have_received(:geocode) }
    end
  end
end
