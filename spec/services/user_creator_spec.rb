require 'spec_helper'

describe UserCreator do
  let(:user) { build_stubbed(:user) }
  let(:params) { user.attributes }

  subject { user }

  before do
    user.stub(:save)
    user.stub(:geocode)
    User.stub(:new).and_return(user)
  end

  describe :execute do
    before { UserCreator.new(params).execute }

    context "when the user is valid" do
      before { user.stub(:valid?).and_return(true) }

      it { should have_received(:save) }
      it { should have_received(:geocode) }
    end
  end
end
