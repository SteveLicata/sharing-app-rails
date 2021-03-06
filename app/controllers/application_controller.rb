class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #paperclip
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :user_name, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :user_name, :first_name, :last_name])
  end

  #devise
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

end
