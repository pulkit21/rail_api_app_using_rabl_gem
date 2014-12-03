class Applicant < ActiveRecord::Base
  belongs_to :job
  validates_presence_of :name, :contact, :email, :resume
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  mount_uploader :resume, JobResumeUploader
end
