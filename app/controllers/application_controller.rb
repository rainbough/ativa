class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user! 
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

	  devise_parameter_sanitizer.for(:account_update) << :name
	  devise_parameter_sanitizer.for(:account_update) << :profile_pic
	  devise_parameter_sanitizer.for(:sign_up) << :name
	  devise_parameter_sanitizer.for(:sign_up) << :profile_pic
	end

  protect_from_forgery with: :exception
end
