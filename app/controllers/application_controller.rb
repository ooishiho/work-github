class ApplicationController < ActionController::Base
   before_action :authenticate_admin!, except: [:top]
   before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    admin_path
  end

  def after_sign_out_path_for(resource)
    sign_in_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephon_nunber])
  end
end
