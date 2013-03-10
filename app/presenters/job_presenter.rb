class JobPresenter
  def self.latest(size)
    Job.order("created_at desc").limit(size)
  end
end
