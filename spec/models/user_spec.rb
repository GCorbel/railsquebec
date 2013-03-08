require 'spec_helper'

describe User do
  subject(:user) { build(:user) }

  its(:to_s) { should eq user.username }
end
