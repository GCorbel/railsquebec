require 'spec_helper'

describe User do
  subject(:user) { build(:user) }

  it { should have_many(:events) }
  it { should have_many(:jobs) }

  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:username) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:postal_code) }

  its(:to_s) { should eq user.username }
end
