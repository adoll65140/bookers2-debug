class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  #6 , except: [:top, :about]追記
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    current_user
    #10 root_path=>current_user
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
