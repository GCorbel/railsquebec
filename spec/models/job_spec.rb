require 'spec_helper'

describe Job do
  subject(:job) { build(:job) }

  it { should belong_to(:user) }

  it { should validate_presence_of(:company_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:post_name) }
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:postal_code) }
  it { should validate_presence_of(:description) }

  its(:to_s) { should eq job.post_name }
end
