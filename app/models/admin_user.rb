class AdminUser < ApplicationRecord
  extend Enumerize

  self.table_name = "my_logins"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:admin_google_oauth2]

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  enumerize :login_type, in: { normal: 0, google: 1, facebook: 2 }

  def self.from_omniauth(access_token)
    data = access_token.info
    my_login = MyLogin.where(email: data['email']).first_or_create do |my_login|
      my_login.email = data['email']
      my_login.username = data['name']
      my_login.password = data['name']
      my_login.login_type = MyLogin.login_type.google
    end

    my_login.save!
    my_login
  end
end
