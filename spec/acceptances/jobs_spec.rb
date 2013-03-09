require 'spec_helper'

feature "jobs" do
  scenario "Show the list of jobs" do
    job = create(:job)
    visit jobs_path
    expect(page).to have_content(job.post_name)
  end
end
