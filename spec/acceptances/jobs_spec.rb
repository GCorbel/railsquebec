require 'spec_helper'

feature "jobs" do
  let!(:job) { create(:job) }

  scenario "Show the list of jobs" do
    visit jobs_path
    expect(page).to have_content(job.post_name)
  end

  scenario "Show a job" do
    visit job_path(job)
    expect(page).to have_content(job.post_name)
  end

  scenario "Create a new job" do
    visit new_job_path
    fill_in "Post name", with: "Post Name"
    fill_in "Company name", with: "Company Name"
    fill_in "Email", with: "guirec.corbel@gmail.com"
    fill_in "City", with: "Montreal"
    fill_in "Street", with: "The street"
    fill_in "Postal code", with: "A1B2C3"
    fill_in "Description", with: "A description"
    click_button "Submit"
    expect(page).to have_content("Job was successfully created")
    expect(page).to have_content("Post Name")
  end
end
