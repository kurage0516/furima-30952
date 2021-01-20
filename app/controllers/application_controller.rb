class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname_ruby])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_ruby])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
  end
end
