class JobPresenter
  def self.latest(size)
    Job.limit(size)
  end
end
