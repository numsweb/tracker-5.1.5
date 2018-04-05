class Api::V1::JobsController < Api::V1::BaseController
  def index
    respond_with Job.all
  end

  def create
    respond_with :api, :v1, Job.create(job_params)
  end

  def destroy
    respond_with Job.destroy(params[:id])
  end

  def update
    job = Job.find(params["id"])
    item.update_attributes(job_params)
    respond_with job, json: job
  end

  private
  def job_params
    params.require(:job).permit(:id, :company, :recruiter, :recruiter_email, :recruiter_phone, :recruiter_cell, :last_contact,
                                :company_website, :position, :company_contact, :company_phone, :company_address, :status_id )
  end
end
