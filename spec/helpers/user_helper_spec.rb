require 'spec_helper'

describe UserHelper do
  describe :link_to_email do
    it "give a link for the mail" do
      expect(link_to_email(user)).to eq ""
    end
  end
end
