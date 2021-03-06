require 'spec_helper'

feature "Jobs" do
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
    sign_in job.user
    visit new_job_path
    fill_job_form
    expect(page).to have_content("Your Job has been created")
    expect(page).to have_content("Post Name")
  end

  scenario "Edit a job" do
    sign_in job.user
    visit edit_job_path(job)
    fill_job_form
    expect(page).to have_content("Your Job has been updated")
    expect(page).to have_content("Post Name")
  end

  scenario "Delete an job" do
    sign_in job.user
    visit job_path(job)
    within(".form-actions") do
      click_on "Delete"
    end
    expect(page).to have_content("Your Job has been deleted")
    expect(page).to_not have_content("Post Name")
  end
end

def fill_job_form
  fill_in "Post name", with: "Post Name"
  fill_in "Company name", with: "Company Name"
  fill_in "Email", with: "guirec.corbel@gmail.com"
  fill_in "City", with: "Montreal"
  fill_in "Street", with: "The street"
  fill_in "Postal code", with: "A1B2C3"
  fill_in "Description", with: "A description"
  click_button "Submit"
end
