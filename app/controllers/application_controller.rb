class ApplicationController < ActionController::Base
  
  # protect_from_forgery with: :exception

  # Разрешить прием параметра username
  # before_action - выполняется перед каждым action
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    # devise_parameter_sanitizer.permit(:sign_up) << :username
  end

end
