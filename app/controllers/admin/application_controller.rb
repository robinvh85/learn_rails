module Admin
  class ApplicationController < ActionController::Base
    before_action :authenticate_my_login!

    protect_from_forgery with: :exception

    def index; end
  end
end
