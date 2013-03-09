require 'spec_helper'

describe Job do
  it { should validate_presence_of(:company_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:post_name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:postal_code) }
end
