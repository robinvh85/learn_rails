class ApplicationController < ActionController::Base
  layout 'adminlte'
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  # To permit new custom attributes to be cerified as attributes permitted by the form
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
  # end

  def index; end

  def copy; end
end
