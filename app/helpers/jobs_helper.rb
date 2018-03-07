module JobsHelper
  def set_class(job)
    Status.find(job.status).name.gsub(" ", "-").downcase
  end

  def get_job_count(status)
    Job.where(status_id: status.id).count
  end
end
