require 'spec_helper'

feature "Events" do
  scenario "Show the list of events" do
    event = create(:event)
    visit events_path
    expect(page).to have_content(event.title)
  end
end
