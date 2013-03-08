require 'spec_helper'

describe UsersHelper do
  let(:user) { build_stubbed(:user) }

  describe :email_for do
    subject { email_for(user) }
    context "when the email of the user is visible" do
      before { user.stub(:email_visible).and_return(true) }
      it "give a link for the mail" do
        should eq "<p><a href=\"mailto:#{user.email}\">#{user.email}</a></p>"
      end
    end

    context "when the email of the user is not visible" do
      before { user.stub(:email_visible?).and_return(false) }
      it { should be_nil }
    end
  end

  describe :twitter_for do
    subject { twitter_for(user) }
    context "when the user has a twitter account" do
      before { user.stub(:twitter).and_return("twitter_account") }
      it "should give a link for the twitter account" do
        should eq "<p><a href=\"http://twitter.com/twitter_account\">twitter_account</a></p>"
      end
    end

    context "when the user don't have a twitter account" do
      before { user.stub(:twitter).and_return(nil) }
      it { should be_nil }
    end
  end

  describe :github_for do
    subject { github_for(user) }
    context "when the user has a github account" do
      before { user.stub(:github).and_return("github_account") }
      it "should give a link for the github account" do
        should eq "<p><a href=\"https://github.com/github_account\">github_account</a></p>"
      end
    end

    context "when the user don't have a github account" do
      before { user.stub(:github).and_return(nil) }
      it { should be_nil }
    end
  end

  describe :website_for do
    subject { website_for(user) }
    context "when the user has a website" do
      before { user.stub(:website).and_return("website") }
      it "should give a link for the website" do
        should eq "<p><a href=\"website\">website</a></p>"
      end
    end

    context "when the user don't have a website" do
      before { user.stub(:website).and_return(nil) }
      it { should be_nil }
    end
  end
end
