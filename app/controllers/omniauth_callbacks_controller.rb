class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
      if @user.persisted?
        #user = User.find_by_provider_and_uid(omniauth["provider"], omniauth["uid"]) || User.create_with_omniauth(omniauth)    
        sign_in(:user, @user)
        # actually if you really really need that id in the session, you can leave this line too :)
        session[:user_id] = @user.id 
        redirect_to categories_path , :notice => "Signed in!"   

        # sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        # set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
        flash[:error] = "Could not persisted"
      end

      # sign_in(@user, :event => :authentication)#this will throw if @user is not activated
      # #set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      # #format.json { render @user }
  end
end