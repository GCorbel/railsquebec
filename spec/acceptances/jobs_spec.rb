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
end
