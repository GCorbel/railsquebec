require 'spec_helper'

describe UserPresenter do
  describe :latest do
    it "give the latest users" do
      user1 = create(:user)
      user2 = create(:user)
      expect(UserPresenter.latest(1)).to eq [user2]
    end
  end
end
