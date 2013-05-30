require 'spec_helper'

describe EventCreator do
  let(:event) { build_stubbed(:event) }
  let(:user) { build_stubbed(:user) }
  let(:params) { event.attributes }

  subject { event }

  before do
    event.stub(:save)
    event.stub(:geocode)
    Event.stub(:new).and_return(event)
  end

  describe :execute do
    before { EventCreator.new(user, params).execute }

    its(:user) { should eq user }

    context "when the event is valid" do
      before { event.stub(:valid?).and_return(true) }

      it { should have_received(:save) }
      it { should have_received(:geocode) }
    end
  end
end
