json.array!(@jobs) do |job|
  json.(job, :latitude, :longitude)
  json.link job_path(job)
  json.title job.post_name
  json.icon image_path('maps/jobs.png')
end
