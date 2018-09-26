class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:my_login).permit(:email, :username, :password, :password_confirmation)
  end
end
