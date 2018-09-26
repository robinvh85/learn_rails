class UsersController < ApplicationController
  def login
    if request.post?
      username = params['username']
      password = params['password']
      user = MyLogin.find_by(username: username)

      sign_in_and_redirect user
    end
  end
end