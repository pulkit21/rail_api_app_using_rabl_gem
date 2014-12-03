class UserMailer < ActionMailer::Base
  # default from: "no-reply@emangu.com"

  def welcome_email(user)
    @user = user
    @url  = "http://#{@user.username}.emangu.com"
    mail(:to => user.email, :from => "no-reply@emangu.com" ,:subject => "Welcome to Emangu")
  end
  
  def contact_to_post_owner(contact)
    @contact_name = contact.name
    @contact = contact
    @contact_from = contact.email
    @user_email = contact.post.user.email
    @user_username = contact.post.user.username
    mail(:to => @user_email, :from => @contact_from, :subject => "You have received a message from your emangu blog")
  end
end
 