require 'spec_helper'

describe UserCreator do
  let(:user) { build_stubbed(:user) }
  let(:user) { build_stubbed(:user) }
  let(:params) { user.attributes }

  before do
    user.stub(:save)
    User.stub(:new).and_return(user)
  end

  describe :execute do
    context "when the user is valid" do
      before { user.stub(:valid?).and_return(true) }

      it "save the user" do
        user.should_receive(:save)
        UserCreator.new(params).execute
      end

      it "geolocalize the user" do
        user.should_receive(:geocode)
        UserCreator.new(params).execute
      end
    end
  end
end
