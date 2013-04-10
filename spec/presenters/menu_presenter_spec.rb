require 'spec_helper'

describe MenuPresenter do
  describe :categories do
    it "give all categories" do
      category1 = create(:category)
      category2 = create(:category)
      expect(MenuPresenter.categories).to eq [category1, category2]
    end
  end
end
