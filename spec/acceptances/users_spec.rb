require 'spec_helper'

feature "Users" do
  scenario "Show the list of users" do
    user = create(:user)
    visit users_path
    expect(page).to have_content(user.username)
  end
end
