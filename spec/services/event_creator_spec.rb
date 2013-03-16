require 'spec_helper'

describe EventCreator do
  let(:event) { build_stubbed(:event) }
  let(:user) { build_stubbed(:user) }
  let(:params) { event.attributes }

  before do
    event.stub(:save)
    Event.stub(:new).and_return(event)
  end

  describe :execute do
    it "assign the user to the event" do
      EventCreator.new(user, params).execute
      expect(event.user).to eq user
    end

    context "when the event is valid" do
      before { event.stub(:valid?).and_return(true) }

      it "save the event" do
        event.should_receive(:save)
        EventCreator.new(user, params).execute
      end

      it "geolocalize the event" do
        event.should_receive(:geocode)
        EventCreator.new(user, params).execute
      end
    end
  end
end
