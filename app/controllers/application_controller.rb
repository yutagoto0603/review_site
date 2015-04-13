class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_out_path_for(resource)
    "/users/sign_in"
  end

  def configure_permitted_parameters
  # devise_parameter_sanitizerメソッドを呼び出す
  devise_parameter_sanitizer.for(:sign_up).push(:nickname, :avatar)
end

  
end
