class Job < ActiveRecord::Base
  has_many :applicants
  validates_presence_of :title, :description
end
