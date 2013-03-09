require 'spec_helper'

describe Event do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:postal_code) }
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:city) }
end
