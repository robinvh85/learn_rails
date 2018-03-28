class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: {minimum: 5, maximum: 20}, format: { with: /\A[A-z]*[0-9]*\z/ }

  validate :check_valid_username

  def check_valid_username
    if username == 'robin' || username == 'robinvh'
      # errors.add(:username, "too_long.other".to_sym, count: 10)
      errors.add(:username, I18n.t('errors.messages.vh_error', count: username.length))
    end
  end
end
