require 'spec_helper'

describe EventPresenter do
  describe :latest do
    it "give the latest events" do
      event1 = create(:event, date: Time.now)
      event2 = create(:event, date: Time.now)
      expect(EventPresenter.latest(1)).to eq [event2]
    end
  end
end
