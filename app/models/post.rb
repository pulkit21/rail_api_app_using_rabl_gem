class Post < ActiveRecord::Base

  validates_presence_of :title, :body
  belongs_to :user
  acts_as_votable
  has_many :contacts
  has_many :comments
  scope :sorted, lambda {order('published_at')}
  scope :published, lambda {where('published_at IS NOT NULL')}
  #Publish the blogpost
  def publish!
    if self.published_nil?
      self.update_attributes(published_at: Time.now)
    elsif published?
      errors.add(:base, "The post has already been published") and return false
    end  
  end

  #Unpublish the blogpost
  def unpublish!
    if self.published?
      self.update_attributes(published_at: nil)
    else self.published_nil?
      errors.add(:base, "The post has not been published yet") and return false
    end
  end

  # Check if the post is current user post
  def users_post(user)
    self.user.id == user.id if !user.nil?
  end

   #If Post published time present 
  def published?
    self.published_at.present?
  end

  #If publish time is nill
  def published_nil?
    self.published_at.nil?
  end

  # Date format in list page
  def post_created_at
    self.created_at.strftime("%b %d, %Y %I:%M %p")
  end

  # Date format in list page
  def post_published_at
    self.published_at.strftime("%b %d, %Y %I:%M %p")
  end

  #Date format
  def set_date
    self.published_at.strftime("%b %d, %Y")
  end
  
  def published_true?
    if self.published?
      true
    else
      false
    end
  end
  
end
