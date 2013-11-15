class AuthController < ApplicationController
  protect_from_forgery except: :success

  skip_before_action :require_login

  def new

  end

  def success
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
