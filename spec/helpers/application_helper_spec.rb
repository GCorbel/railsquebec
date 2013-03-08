require 'spec_helper'

describe ApplicationHelper do
  let(:user) { build_stubbed(:user) }
  let(:avatar_id) { Digest::MD5::hexdigest(user.email).downcase }
  let(:default_url) { "http://test.host:80/assets/guest.png"}

  describe :alert_box do
    context "when there is a message" do
      subject { helper.alert_box("info", "message") }

      it "create a valid message" do
        should eq %Q{<div class=\"alert alert-info\"><button class=\"close\" data-dismiss=\"alert\">x</button><div>message</div></div>}
      end
    end

    context "when there is any message" do
      subject { helper.alert_box("info", nil) }

      it { should be_nil }
    end
  end

  describe :avatar_url do
    before { Rails.env.stubs(:test?).returns(false) }
    after { Rails.env.stubs(:test?).returns(true) }

    it "give a path to the avatar" do
      expect(helper.avatar_url(user)).to eq "http://gravatar.com/avatar/#{avatar_id}.png?s=100&d=#{CGI.escape(default_url)}"
      Rails.env.stubs(:test?).returns(true)
    end

    context "when a size is specified" do
      it "give a path to the avatar with a size" do
        expect(helper.avatar_url(user, 50)).to eq "http://gravatar.com/avatar/#{avatar_id}.png?s=50&d=#{CGI.escape(default_url)}"
      end
    end

    context "the user is nil" do
      it "give a path to the avatar with a size" do
        expect(helper.avatar_url(nil)).to eq "http://test.host:80/assets/guest.png"
      end
    end
  end
end
