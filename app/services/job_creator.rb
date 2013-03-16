class JobCreator
  attr_reader :user, :params
  def initialize(user, params)
    @user = user
    @params = params
  end

  def execute
    job = Job.new(params)
    job.user = user
    if job.valid?
      job.geocode
      job.save
    end
    job
  end
end
