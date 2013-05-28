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
    before { Rails.env.stubs(:production?).returns(true) }
    after { Rails.env.stubs(:production?).returns(false) }

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

  describe :excerpt do
    it "give an execrpt for a phrase" do
      text = "This is a very very very long text. I just text the method to do an execrpt and it will cut this phrase because it's tooooooooooo long. Ho, it's raining today! Kevin is in the kitchen. Where is my umbrella!?"
      expect(excerpt(text)).to eq "This is a very very very long text. I just text the method to do an execrpt and it will cut this phrase because it's tooooooooooo long. Ho, it's raining today! Kevin is in the kitchen. Where is my ..."
    end
  end

  describe :markdown do
    it "convert a markdown to html" do
      expect(helper.markdown("**test**")).to eq "<p><strong>test</strong></p>\n"
    end
  end

  describe :browser_title do
    it "send a content for the title" do
      helper.browser_title('A title')
      expect(helper.content_for(:title)).to eq 'A title'
    end
  end

  describe :browser_description do
    it "send a content for the description" do
      helper.browser_description('A description')
      expect(helper.content_for(:description)).to eq 'A description'
    end
  end

  describe :browser_keywords do
    it "send a content for the description" do
      helper.browser_keywords('Some keywords')
      expect(helper.content_for(:keywords)).to eq 'Some keywords'
    end
  end
end
