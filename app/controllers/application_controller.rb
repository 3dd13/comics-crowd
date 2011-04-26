class ApplicationController < ActionController::Base
  protect_from_forgery
  
  RailsAdmin.authorize_with do
    redirect_to root_path unless current_user.is_admin?
  end
end
