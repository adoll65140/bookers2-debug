class ApplicationController < ActionController::Base
  
  #6 , except: [:top, :about]追記
  #6解答　before_action :authenticate_user!, except: [:top, :about]消去
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
    #10 root_path=>current_user
    #10解答　current_user=>user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
