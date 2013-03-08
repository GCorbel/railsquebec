require 'spec_helper'

feature "Users" do
  given!(:user) { create(:user) }

  scenario "Show the list of users" do
    visit users_path
    expect(page).to have_content(user.username)
  end

  scenario "Visit a user page" do
    visit user_path(user)
    expect(page).to have_content(user.username)
  end
end
