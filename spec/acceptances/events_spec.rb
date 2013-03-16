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
    sign_in event.user
    visit new_event_path
    fill_form
    expect(page).to have_content("Event was successfully created")
    expect(page).to have_content("Event title")
  end

  scenario "Edit an event" do
    sign_in event.user
    visit edit_event_path(event)
    fill_form
    expect(page).to have_content("Event was successfully updated")
    expect(page).to have_content("Event title")
  end

  scenario "Delete an event" do
    sign_in event.user
    visit event_path(event)
    click_on "Delete"
    expect(page).to have_content("Event was successfully destroyed")
    expect(page).to_not have_content("Event title")
  end
end

def fill_form
  fill_in "Title",       with: "Event title"
  fill_in "Street",      with: "A street"
  fill_in "Postal code", with: "A1B2C3"
  fill_in "City",        with: "Montreal"
  fill_in "Description", with: "A description"
  click_button "Submit"
end
