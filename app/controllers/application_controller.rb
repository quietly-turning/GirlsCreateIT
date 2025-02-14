class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def must_be_logged_in
    unless current_user
      redirect_to root_url
    end
  end
  
  def admin_only
    unless current_user and current_user.admin?
      redirect_to root_url
    end
  end
end
