class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |params|
    params.permit(
      :email, :password, :password_confirmation, :fname,
      :lname
    )
  }
  devise_parameter_sanitizer.for(:account_update) { |params|
    params.permit(
      :email, :password, :password_confirmation, :fname,
      :lname
    )
  }
end
end
