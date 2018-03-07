class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /jobs
  # GET /jobs.json
  def index
    #set up logic for the order links (ASC/DESC)
    if session[:sort_order].blank?
      session[:sort_order] = "ASC"
    else
      case session[:sort_order]
        when "ASC"
          session[:sort_order] = "DESC"
        when "DESC"
          session[:sort_order] = "ASC"
      end
    end
    @selected_status = params[:filter]
    @selected_status = "All" if @selected_status.blank?
    @jobs = Job.search(params.merge(:sort_order => session[:sort_order], :filter => params[:filter]))
    @statuses = Status.all.order("display_order ASC")
    respond_to do |format|
      format.html { render :index}
      format.json {render @jobs.to_json, status: :ok}
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:company, :recruiter, :recruiter_email, :last_contact, :recruiter_phone, :recruiter_cell, :company_website, :company_address, :company_contact, :company_phone, :position, :comments, :status_id)

    end
end
