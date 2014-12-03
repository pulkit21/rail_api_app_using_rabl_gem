class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :content
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :content, :maximum => 500
  after_create :send_contact
  belongs_to :post
  def send_contact
    UserMailer.contact_to_post_owner(self).deliver
  end
end
