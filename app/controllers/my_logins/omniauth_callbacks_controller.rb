# frozen_string_literal: true

module MyLogins
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @my_login = MyLogin.from_omniauth(request.env['omniauth.auth'])

      if @my_login.persisted?
        flash[:notice] = 'Login successful'
        sign_in_and_redirect @my_login, event: :authentication
      else
        flash[:error] = 'Login fail'
        redirect_to my_login_session_path
      end
    end
  end
end
