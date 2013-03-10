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

  scenario "Create a new event" do
    visit new_event_path
    fill_in "Title",       with: "Event title"
    fill_in "Street",      with: "A street"
    fill_in "Postal code", with: "A1B2C3"
    fill_in "City",        with: "Montreal"
    fill_in "Description", with: "A description"
    click_button "Submit"
    expect(page).to have_content("Event was successfully created")
    expect(page).to have_content("Event title")
  end
end
