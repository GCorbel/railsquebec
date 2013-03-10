require 'spec_helper'

describe JobPresenter do
  describe :latest do
    it "give the latest jobs" do
      job1 = create(:job)
      job2 = create(:job)
      expect(JobPresenter.latest(1)).to eq [job2]
    end
  end
end
