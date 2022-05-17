class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if request.fullpath.include? "admin"
      admin_root_path
    else
      posts_path
    end
  end

  def after_sign_out_path_for(resource)
    if request.fullpath.include? "admin"
      admin_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_name])
  end
end
