class Portfolio < ActiveRecord::Base

  belongs_to :user
  mount_uploader :work, PortfolioWorkUploader
  validates_presence_of :work, :title, :description
end
