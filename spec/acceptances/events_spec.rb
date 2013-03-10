require 'spec_helper'

feature "Events" do
  let!(:event) { create(:event) }

  scenario "Show the list of events" do
    visit events_path
    expect(page).to have_content(event.title)
  end

  scenario "Show an event" do
    visit event_path(event)
    expect(page).to have_content(event.title)
  end
end
