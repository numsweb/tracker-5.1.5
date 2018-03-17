class Job < ApplicationRecord

  validates_presence_of :company
  validates_presence_of :position
  validates_presence_of :status_id
  belongs_to :status

  scope :status_new, ->  { where(:status_id => Status.find_by_name("New").id) }

  scope :status_waiting_feedback, ->  { where(:status_id => Status.find_by_name("Waiting Feedback").id) }
  scope :status_submitted_info, ->  { where(:status_id => Status.find_by_name("Submitted Info").id) }
  scope :status_call_screen_scheduled, ->  { where(:status_id => Status.find_by_name("Call Screen Scheduled").id) }
  scope :status_interview_scheduled, ->  { where(:status_id => Status.find_by_name("Interview Scheduled").id) }
  scope :status_deactivated, ->  { where(:status_id => Status.find_by_name("Deactivated").id) }
  scope :status_dead_lead, ->  { where(:status_id => Status.find_by_name("Dead Lead").id) }
  scope :status_not_accepted, ->  { where(:status_id => Status.find_by_name("Not Accepted").id) }
  scope :status_hired, ->  { where(:status_id => Status.find_by_name("Hired").id) }
  scope :status_resigned, ->  { where(:status_id => Status.find_by_name("Resigned").id) }


  def self.search(params)
    if params[:order]
      if params[:order] == "status"
        @jobs = Job.all.includes(:status).order("statuses.name #{params[:sort_order]}")
      else
        @jobs = Job.all.order("#{params[:order]} #{params[:sort_order]}")
      end
    elsif params[:search] && params[:search][:item]
      search_item = params[:search][:item].downcase
      @jobs = Job.where(
          "LOWER(company) LIKE '%#{search_item}%'
            OR LOWER(recruiter) LIKE '%#{search_item}%'
            OR LOWER(recruiter_email) LIKE '%#{search_item}%'
            OR LOWER(recruiter_phone) LIKE '%#{search_item}%'
            OR LOWER(company_website) LIKE '%#{search_item}%'
            OR LOWER(company_address) LIKE '%#{search_item}%'
            OR LOWER(company_contact) LIKE '%#{search_item}%'
            OR LOWER(company_phone) LIKE '%#{search_item}%'
            OR LOWER(position) LIKE '%#{search_item}%'
            OR LOWER(comments) LIKE '%#{search_item}%'
            "
      ).order("status_id ASC")
    else
      @jobs = Job.all.order("status_id ASC")
    end
    if params[:filter]
      filter = params[:filter]
      if filter.include?("%20")
        filter = filter.gsub("%20" ," ")
      end
      case filter
        when "New"
          @jobs = @jobs.status_new
        when "Waiting Feedback"
          @jobs = @jobs.status_waiting_feedback
        when "Submitted Info"
          @jobs = @jobs.status_submitted_info
        when  "Call Screen Scheduled"
          @jobs = @jobs.status_call_screen_scheduled
        when "Interview Scheduled"
          @jobs = @jobs.status_interview_scheduled
        when "Deactivated"
          @jobs = @jobs.status_deactivated
        when "Dead Lead"
          @jobs = @jobs.status_dead_lead
        when "Not Accepted"
          @jobs = @jobs.status_not_accepted
        when "Hired"
          @jobs = @jobs.status_hired
        when "Resigned"
          @jobs = @jobs.status_resigned
      end

    end
    @jobs
  end
end
